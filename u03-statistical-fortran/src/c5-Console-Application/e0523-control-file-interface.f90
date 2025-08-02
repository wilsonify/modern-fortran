module elogit_control_mod
    use dynamic_allocation_mod
    implicit none

    integer, parameter :: our_int = selected_int_kind(9)
    integer, parameter :: file_name_length = 256
    integer, parameter :: var_name_length = 32
    integer, parameter :: ctrl_line_width = 32
    character(len=*), parameter :: modname = "elogit_control_mod"

    type :: error_type
        integer :: dummy = 0  ! Placeholder for future error info
    end type

    type :: elogit_ctrlfile_type
        sequence
        integer(kind=our_int) :: ncase = 0, nvar = 0
        logical :: case_id_present = .false., names_file_present = .false.
        character(len=file_name_length) :: data_file_name = "", names_file_name = ""
        logical :: by_name = .false., grouped = .false.
        integer(kind=our_int), pointer :: resp_col(:) => null()
        character(len=var_name_length), pointer :: resp_name(:) => null()
        logical :: intercept_present = .false.
        integer(kind=our_int) :: npred = 0
        integer(kind=our_int), pointer :: pred_col(:) => null()
        character(len=var_name_length), pointer :: pred_names(:) => null()
    end type elogit_ctrlfile_type

contains

    ! Minimal stub for error handler - replace with real implementation
    subroutine err_handle(err, err_code, called_from, file_name, line_no, custom_1)
        type(error_type), intent(inout) :: err
        integer, intent(in), optional :: err_code, line_no
        character(len=*), intent(in), optional :: called_from, file_name, custom_1
        ! This is a placeholder to silence calls
        err%dummy = 1
    end subroutine err_handle

    ! Skip blank and comment lines (starting with '#').
    integer function skip_comment_lines(unit, line_no) result(status)
        integer, intent(in) :: unit
        integer, intent(inout) :: line_no
        character(len=256) :: line
        integer :: ios

        do
            read(unit, '(A)', iostat=ios) line
            if (ios /= 0) then
                status = -1
                return
            end if
            line_no = line_no + 1
            if (len_trim(line) == 0) cycle
            if (line(1:1) /= '#') exit
        end do
        status = 0
    end function skip_comment_lines

    ! Nullify/reset the control file structure
    integer(our_int) function nullify_elogit_ctrlfile(ctrlfile, err) result(answer)
        type(elogit_ctrlfile_type), intent(inout) :: ctrlfile
        type(error_type), intent(inout) :: err

        ctrlfile%ncase = 0
        ctrlfile%nvar = 0
        ctrlfile%case_id_present = .false.
        ctrlfile%names_file_present = .false.
        ctrlfile%data_file_name = ""
        ctrlfile%names_file_name = ""

        ! Deallocate pointers safely if allocated
        if (associated(ctrlfile%resp_col)) call dyn_dealloc_int(ctrlfile%resp_col)
        if (associated(ctrlfile%resp_name)) call dyn_dealloc_char_fixed32(ctrlfile%resp_name)
        if (associated(ctrlfile%pred_col)) call dyn_dealloc_int(ctrlfile%pred_col)
        if (associated(ctrlfile%pred_names)) call dyn_dealloc_char_fixed32(ctrlfile%pred_names)

        answer = RETURN_SUCCESS
    end function nullify_elogit_ctrlfile

    ! Read ELOGIT control file with structured error handling and guaranteed cleanup
    integer(kind=our_int) function read_elogit_ctrlfile(control_file_name, ctrlfile, err) result(answer)
        character(len=*), intent(in) :: control_file_name
        type(elogit_ctrlfile_type), intent(out) :: ctrlfile
        type(error_type), intent(inout) :: err

        integer :: ios, unit, current_line, i, posn, alloc_status
        character(len=ctrl_line_width) :: line
        logical :: file_opened, read_failed

        answer = RETURN_FAIL
        file_opened = .false.
        read_failed = .false.
        current_line = 0

        ! Check filename presence
        if (trim(control_file_name) == "") then
            call err_handle(err, 1000, called_from="read_elogit_ctrlfile in MOD "//modname, &
                custom_1="No control file name specified.")
            return
        end if

        open(newunit=unit, file=control_file_name, status="old", iostat=ios)
        if (ios /= 0) then
            call err_handle(err, 1, called_from="read_elogit_ctrlfile in MOD "//modname, &
                file_name=control_file_name)
            return
        end if
        file_opened = .true.

        ! Begin reading control file
        if (skip_comment_lines(unit, current_line) /= RETURN_SUCCESS) then
            call err_handle(err, 3, called_from="read_elogit_ctrlfile in MOD "//modname, &
                file_name=control_file_name, line_no=current_line)
            read_failed = .true.
            goto 999
        end if

        ! Read ncase, nvar, case_id_present
        current_line = current_line + 1
        read(unit, '(A)', iostat=ios) line
        if (ios /= 0) then ;            read_failed = .true.;            goto 999;            end if
        read(line, *, iostat=ios) ctrlfile%ncase, ctrlfile%nvar, ctrlfile%case_id_present
        if (ios /= 0) then; read_failed = .true.; goto 999; end if

        ! Read data file name (left-justified)
        current_line = current_line + 1
        read(unit, '(A)', iostat=ios) ctrlfile%data_file_name
        if (ios /= 0) then; read_failed = .true.; goto 999; end if
        ctrlfile%data_file_name = adjustl(ctrlfile%data_file_name)

        ! Read names file name and set flag
        current_line = current_line + 1
        read(unit, '(A)', iostat=ios) ctrlfile%names_file_name
        if (ios /= 0) then; read_failed = .true.; goto 999; end if
        if (trim(ctrlfile%names_file_name) == "") then
            ctrlfile%names_file_present = .false.
        else
            ctrlfile%names_file_present = .true.
            ctrlfile%names_file_name = adjustl(ctrlfile%names_file_name)
        end if

        ! Skip comments before model specification
        if (skip_comment_lines(unit, current_line) /= RETURN_SUCCESS) then
            call err_handle(err, 3, called_from="read_elogit_ctrlfile in MOD "//modname, &
                file_name=control_file_name, line_no=current_line)
            read_failed = .true.
            goto 999
        end if

        ! Read by_name and grouped flags
        current_line = current_line + 1
        read(unit, '(A)', iostat=ios) line
        if (ios /= 0) then; read_failed = .true.; goto 999; end if
        read(line, *, iostat=ios) ctrlfile%by_name, ctrlfile%grouped
        if (ios /= 0) then; read_failed = .true.; goto 999; end if

        ! Read response variable(s)
        current_line = current_line + 1
        read(unit, '(A)', iostat=ios) line
        if (ios /= 0) then; read_failed = .true.; goto 999; end if

        if (ctrlfile%by_name) then
            if (ctrlfile%grouped) then
                alloc_status = dyn_alloc_char_fixed32(ctrlfile%resp_name, 2)
                if (alloc_status /= RETURN_SUCCESS) then; read_failed = .true.; goto 999; end if
            else
                alloc_status = dyn_alloc_char_fixed32(ctrlfile%resp_name, 1)
                if (alloc_status /= RETURN_SUCCESS) then; read_failed = .true.; goto 999; end if
            end if

            if (trim(line) == "") then; read_failed = .true.; goto 999; end if

            line = adjustl(line)
            posn = index(line, " ")
            if (posn == 0) then
                ctrlfile%resp_name(1) = trim(line)
                if (ctrlfile%grouped) then
                    read_failed = .true.
                    goto 999
                end if
            else
                ctrlfile%resp_name(1) = trim(line(:posn-1))
                line = adjustl(line(posn+1:))
                if (ctrlfile%grouped) then
                    posn = index(line, " ")
                    if (posn == 0) then
                        ctrlfile%resp_name(2) = trim(line)
                    else
                        ctrlfile%resp_name(2) = trim(line(:posn-1))
                    end if
                end if
            end if

        else
            if (ctrlfile%grouped) then
                alloc_status = dyn_alloc_int(ctrlfile%resp_col, 2)
                if (alloc_status /= RETURN_SUCCESS) then; read_failed = .true.; goto 999; end if
                read(line, *, iostat=ios) ctrlfile%resp_col(1), ctrlfile%resp_col(2)
            else
                alloc_status = dyn_alloc_int(ctrlfile%resp_col, 1)
                if (alloc_status /= RETURN_SUCCESS) then; read_failed = .true.; goto 999; end if
                read(line, *, iostat=ios) ctrlfile%resp_col(1)
            end if
            if (ios /= 0) then; read_failed = .true.; goto 999; end if
        end if

        ! Read intercept_present
        current_line = current_line + 1
        read(unit, '(A)', iostat=ios) line
        if (ios /= 0) then; read_failed = .true.; goto 999; end if
        read(line, *, iostat=ios) ctrlfile%intercept_present
        if (ios /= 0) then; read_failed = .true.; goto 999; end if

        ! Read npred
        current_line = current_line + 1
        read(unit, '(A)', iostat=ios) line
        if (ios /= 0) then; read_failed = .true.; goto 999; end if
        read(line, *, iostat=ios) ctrlfile%npred
        if (ios /= 0) then; read_failed = .true.; goto 999; end if

        ! Read predictor variables if any
        if (ctrlfile%npred > 0) then
            if (ctrlfile%by_name) then
                alloc_status = dyn_alloc_char_fixed32(ctrlfile%pred_names, ctrlfile%npred)
                if (alloc_status /= RETURN_SUCCESS) then; read_failed = .true.; goto 999; end if
                do i = 1, ctrlfile%npred
                    current_line = current_line + 1
                    read(unit, '(A)', iostat=ios) line
                    if (ios /= 0) then; read_failed = .true.; goto 999; end if
                    if (trim(line) == "") then; read_failed = .true.; goto 999; end if
                    line = adjustl(line)
                    if (line(1:1) == "*") then; read_failed = .true.; goto 999; end if
                    posn = index(line, " ")
                    if (posn == 0) then
                        ctrlfile%pred_names(i) = trim(line)
                    else
                        ctrlfile%pred_names(i) = trim(line(:posn-1))
                    end if
                end do
            else
                alloc_status = dyn_alloc_int(ctrlfile%pred_col, ctrlfile%npred)
                if (alloc_status /= RETURN_SUCCESS) then; read_failed = .true.; goto 999; end if
                do i = 1, ctrlfile%npred
                    current_line = current_line + 1
                    read(unit, '(A)', iostat=ios) line
                    if (ios /= 0) then; read_failed = .true.; goto 999; end if
                    read(line, *, iostat=ios) ctrlfile%pred_col(i)
                    if (ios /= 0) then; read_failed = .true.; goto 999; end if
                end do
            end if
        end if

        ! Success: set return code
        answer = RETURN_SUCCESS

999     continue
        if (file_opened) close(unit)
        if (read_failed) then
            call nullify_elogit_ctrlfile(ctrlfile, err)
            call err_handle(err, 3, called_from="read_elogit_ctrlfile in MOD "//modname, &
                file_name=control_file_name, line_no=current_line)
        end if

    end function read_elogit_ctrlfile

end module elogit_control_mod
