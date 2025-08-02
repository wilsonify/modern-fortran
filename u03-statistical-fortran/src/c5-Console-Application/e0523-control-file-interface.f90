module elogit_control_mod
    use dynamic_allocation_mod
    implicit none
    integer, parameter :: our_int = selected_int_kind(9)
    integer, parameter :: file_name_length = 256
    integer, parameter :: var_name_length = 32
    integer, parameter :: ctrl_line_width = 32
    integer :: posn = 0
    character(len = *), parameter :: modname = "elogit_control_mod"

    type :: error_type
        ! Placeholder — define fields as needed
        integer :: dummy = 0
    end type

    type :: elogit_ctrlfile_type
        ! unlike other types, the contents of this one are public
        sequence
        ! data input section
        integer(kind = our_int) :: ncase = 0, nvar = 0
        logical :: case_id_present = .false., names_file_present = .false.
        character(len = file_name_length) :: data_file_name = "", &
                names_file_name = ""
        ! model specification section
        logical :: by_name = .false., grouped = .false.
        integer(kind = our_int), pointer :: resp_col(:) => null()
        character(len = var_name_length), pointer :: resp_name(:) => null()
        logical :: intercept_present = .false.
        integer(kind = our_int) :: npred = 0
        integer(kind = our_int), pointer :: pred_col(:) => null()
        character(len = var_name_length), pointer :: &
                pred_names(:) => null()
        ! We’ll add more components to this type later
    end type elogit_ctrlfile_type
    !##################################################################

contains
    integer function skip_comment_lines(unit, line_no) result(status)
        integer, intent(in) :: unit
        integer, intent(inout) :: line_no
        character(len = 256) :: line
        integer :: ios

        do
            read(unit, '(A)', iostat = ios) line
            if (ios /= 0) then
                status = -1  ! or RETURN_FAIL
                return
            end if
            line_no = line_no + 1
            if (len_trim(line) == 0) cycle  ! skip blank lines
            if (line(1:1) /= '#') exit      ! found a non-comment line
        end do

        status = 0  ! RETURN_SUCCESS
    end function skip_comment_lines


    integer(our_int) function nullify_elogit_ctrlfile(ctrlfile, err) result(answer)
        implicit none
        type(elogit_ctrlfile_type), intent(inout) :: ctrlfile
        type(error_type), intent(inout) :: err

        ctrlfile%ncase = 0
        ctrlfile%nvar = 0
        ctrlfile%case_id_present = .false.
        ctrlfile%names_file_present = .false.
        ctrlfile%data_file_name = ""
        ctrlfile%names_file_name = ""

        answer = RETURN_SUCCESS
    end function nullify_elogit_ctrlfile
    !##################################################################
    integer(kind = our_int) function read_elogit_ctrlfile(&
            control_file_name, ctrlfile, err) result(answer)
        ! Reads information from an ELOGIT control file and stores
        ! it in an elogit_ctrlfile_type. If the read operation fails for
        ! any reason, the elogit_ctrlfile_type is nullified and the
        ! returned value is RETURN_FAIL.
        implicit none
        ! declare arguments
        integer :: ctrl_file_handle, i
        character(len = *), intent(in) :: control_file_name
        type(elogit_ctrlfile_type), intent(out) :: ctrlfile
        type(error_type), intent(inout) :: err
        ! declare local variables and parameters
        integer(kind = our_int) :: current_line, ijunk
        character(len = ctrl_line_width) :: line
        character(len = *), parameter :: subname = "read_elogit_ctrlfile"
        ! open the control file
        answer = RETURN_FAIL
        if(control_file_name == "") goto 700
        open(unit = ctrl_file_handle, file = control_file_name, &
                status = "old", err = 800)
        current_line = 0
        !###############################
        ! Dataset input section
        if(skip_comment_lines(ctrl_file_handle, current_line) &
                == RETURN_FAIL) goto 900
        ! read ncase, nvar, case_id_present
        current_line = current_line + 1
        read(unit = ctrl_file_handle, fmt = "(A)", err = 900, end = 900) line
        read(line, *, err = 900, end = 900) &
                ctrlfile%ncase, ctrlfile%nvar, ctrlfile%case_id_present
        ! read data_file_name and left-justify
        current_line = current_line + 1
        read(unit = ctrl_file_handle, fmt = "(A)", err = 900, end = 900) &
                ctrlfile%data_file_name
        ctrlfile%data_file_name = adjustl(ctrlfile%data_file_name)
        ! read names_file_name and set names_file_present
        current_line = current_line + 1
        read(unit = ctrl_file_handle, fmt = "(A)", err = 900, end = 900) &
                ctrlfile%names_file_name
        if(ctrlfile%names_file_name == "") then
            ctrlfile%names_file_present = .false.
        else
            ctrlfile%names_file_present = .true.
            ctrlfile%names_file_name = adjustl(ctrlfile%names_file_name)
        end if
        !###############################
        !###############################
        ! Model specification section
        if(skip_comment_lines(ctrl_file_handle, current_line) &
                == RETURN_FAIL) goto 900
        ! read by_name, grouped
        current_line = current_line + 1
        read(unit = ctrl_file_handle, fmt = "(A)", err = 900, end = 900) line
        read(line, *, err = 900, end = 900) ctrlfile%by_name, &
                ctrlfile%grouped
        ! read yvar, nvar
        current_line = current_line + 1
        read(unit = ctrl_file_handle, fmt = "(A)", err = 900, end = 900) line
        if(ctrlfile%by_name) then
            if(ctrlfile%grouped) then
                if(dyn_alloc(ctrlfile%resp_name, 2, err) == &
                        RETURN_FAIL) goto 800
            else
                if(dyn_alloc(ctrlfile%resp_name, 1, err) == &
                        RETURN_FAIL) goto 800
            end if
            ! set pred_name
            if(line == "") goto 900
            line = adjustl(line)
            posn = index(line, " ")
            ctrlfile%resp_name(1) = line(:posn - 1)
            line = line(posn:)
            if(ctrlfile%grouped) then
                if(line == "") goto 900
                line = adjustl(line)
                posn = index(line, " ")
                ctrlfile%resp_name(2) = line(:posn - 1)
            end if
        else
            ! set pred_col
            if(ctrlfile%grouped) then
                if(dyn_alloc(ctrlfile%resp_col, 2, err) == &
                        RETURN_FAIL) goto 800
                read(line, *, err = 900, end = 900) ctrlfile%resp_col(1), &
                        ctrlfile%resp_col(2)

            else
                if(dyn_alloc(ctrlfile%resp_col, 1, err) == &
                        RETURN_FAIL) goto 800
                read(line, *, err = 900, end = 900) ctrlfile%resp_col(1)
            end if
        end if
        ! read intercept_present
        current_line = current_line + 1
        read(unit = ctrl_file_handle, fmt = "(A)", err = 900, end = 900) line
        read(line, *, err = 900, end = 900) ctrlfile%intercept_present
        ! read npred
        current_line = current_line + 1
        read(unit = ctrl_file_handle, fmt = "(A)", err = 900, end = 900) line
        read(line, *, err = 900, end = 900) ctrlfile%npred
        ! read predictor variables, if any
        if(ctrlfile%npred > 0) then
            if(ctrlfile%by_name) then
                if(dyn_alloc(ctrlfile%pred_names, ctrlfile%npred, err) &
                        == RETURN_FAIL) goto 800
                do i = 1, ctrlfile%npred
                    current_line = current_line + 1
                    read(unit = ctrl_file_handle, fmt = "(A)", err = 900, &
                            end = 900) line
                    if(line == "") goto 900
                    line = adjustl(line)
                    if(line(1:1) == "*") goto 900
                    posn = index(line, " ")
                    ctrlfile%pred_names(i) = line(:posn - 1)
                end do
            else
                if(dyn_alloc(ctrlfile%pred_col, ctrlfile%npred, err) &
                        == RETURN_FAIL) goto 800
                do i = 1, ctrlfile%npred
                    current_line = current_line + 1
                    read(unit = ctrl_file_handle, fmt = "(A)", err = 900, &
                            end = 900) line
                    read(line, *, err = 900, end = 900) ctrlfile%pred_col(i)
                end do
            end if
        end if
        ! normal exit
        close(unit = ctrl_file_handle)
        answer = RETURN_SUCCESS
        return
        ! error traps
        700 call err_handle(err, 1000, &
                called_from = subname // " in MOD " // modname, &
                custom_1 = "No control file name specified.")
        goto 999
        800 call err_handle(err, 1, &
                called_from = subname // " in MOD " // modname, &
                file_name = control_file_name)
        goto 999
        900 call err_handle(err, 3, &
                called_from = subname // " in MOD " // modname, &
                file_name = control_file_name, line_no = current_line)
        goto 999
        ! final cleanup in the event of an error
        999 continue
        close(unit = ctrl_file_handle)
        ijunk = nullify_elogit_ctrlfile(ctrlfile, err)
    end function read_elogit_ctrlfile
    !##################################################################
end module elogit_control_mod
