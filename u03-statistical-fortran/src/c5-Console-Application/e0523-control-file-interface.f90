module elogit_control_mod
    use iso_fortran_env, only : int32
    use dynamic_allocation_mod
    implicit none

    private
    public :: elogit_ctrlfile_type, nullify_elogit_ctrlfile, read_elogit_ctrlfile
    public :: our_int, file_name_length, var_name_length, ctrl_line_width

    ! Configuration parameters
    integer, parameter :: our_int = selected_int_kind(9)
    integer, parameter :: file_name_length = 256
    integer, parameter :: var_name_length = 32
    integer, parameter :: ctrl_line_width = 256

    character(len = *), parameter :: modname = "elogit_control_mod"
    integer, parameter :: ctrl_file_handle = 42

    !---------------------------
    ! Type Definitions
    !---------------------------
    type :: elogit_ctrlfile_type
        integer(our_int) :: ncase
        integer(our_int) :: nvar
        logical :: case_id_present
        character(len = file_name_length) :: data_file_name
        character(len = file_name_length) :: names_file_name
        logical :: names_file_present
        logical :: by_name
        logical :: grouped
        logical :: intercept_present
        integer(our_int) :: npred
        integer(our_int), pointer :: resp_col(:) => null()
        character(len = var_name_length), pointer :: resp_name(:) => null()
        integer(our_int), pointer :: pred_col(:) => null()
        character(len = var_name_length), pointer :: pred_names(:) => null()
    end type elogit_ctrlfile_type

    type :: error_type
        ! Define your error tracking structure here
        ! Placeholder for demo purposes
        integer :: code
        character(len = 128) :: message
    end type error_type

contains

    !-------------------------------
    ! Function: nullify_elogit_ctrlfile
    !-------------------------------
    integer(our_int) function nullify_elogit_ctrlfile(ctrlfile, err) result(answer)
        type(elogit_ctrlfile_type), intent(inout) :: ctrlfile
        type(error_type), intent(inout) :: err

        if (associated(ctrlfile%resp_col))     call dyn_dealloc_int(ctrlfile%resp_col)
        if (associated(ctrlfile%resp_name))    call dyn_dealloc_char_fixed32(ctrlfile%resp_name)
        if (associated(ctrlfile%pred_col))     call dyn_dealloc_int(ctrlfile%pred_col)
        if (associated(ctrlfile%pred_names))   call dyn_dealloc_char_fixed32(ctrlfile%pred_names)

        ctrlfile%ncase = 0
        ctrlfile%nvar = 0
        ctrlfile%case_id_present = .false.
        ctrlfile%names_file_present = .false.
        ctrlfile%data_file_name = ""
        ctrlfile%names_file_name = ""
        ctrlfile%by_name = .false.
        ctrlfile%grouped = .false.
        ctrlfile%intercept_present = .false.
        ctrlfile%npred = 0

        answer = RETURN_SUCCESS
    end function nullify_elogit_ctrlfile

    !-------------------------------
    ! Function: read_elogit_ctrlfile
    !-------------------------------
    integer(our_int) function read_elogit_ctrlfile(control_file_name, ctrlfile, err) result(answer)
        character(len = *), intent(in) :: control_file_name
        type(elogit_ctrlfile_type), intent(out) :: ctrlfile
        type(error_type), intent(inout) :: err

        character(len = ctrl_line_width) :: line
        integer(our_int) :: current_line, junk
        character(len = *), parameter :: subname = "read_elogit_ctrlfile"

        answer = RETURN_FAIL
        current_line = 0

        if (control_file_name == "") then
            call err_handle(err, 1000, called_from = subname // " in MOD " // modname, &
                    custom_1 = "No control file name specified.")
            return
        end if

        open(unit = ctrl_file_handle, file = control_file_name, status = "old", err = 800)

        ! Skip comments
        if (skip_comment_lines(ctrl_file_handle, current_line) == RETURN_FAIL) then
            goto 900
        end if

        ! Line 1: Read ncase, nvar, case_id_present
        current_line = current_line + 1
        read(ctrl_file_handle, "(A)", err = 900, end = 900) line
        read(line, *, err = 900, end = 900) ctrlfile%ncase, ctrlfile%nvar, ctrlfile%case_id_present

        ! Line 2: Read data file name
        current_line = current_line + 1
        read(ctrl_file_handle, "(A)", err = 900, end = 900) ctrlfile%data_file_name
        ctrlfile%data_file_name = adjustl(ctrlfile%data_file_name)

        ! Line 3: Read names file name
        current_line = current_line + 1
        read(ctrl_file_handle, "(A)", err = 900, end = 900) ctrlfile%names_file_name
        if (ctrlfile%names_file_name == "") then
            ctrlfile%names_file_present = .false.
        else
            ctrlfile%names_file_present = .true.
            ctrlfile%names_file_name = adjustl(ctrlfile%names_file_name)
        end if

        close(unit = ctrl_file_handle)
        answer = RETURN_SUCCESS
        return

        800     continue
        call err_handle(err, 1, called_from = subname // " in MOD " // modname, &
                file_name = control_file_name)
        goto 999

        900     continue
        call err_handle(err, 3, called_from = subname // " in MOD " // modname, &
                file_name = control_file_name, line_no = current_line)

        999     continue
        close(unit = ctrl_file_handle, iostat = junk)
        junk = nullify_elogit_ctrlfile(ctrlfile, err)
        answer = RETURN_FAIL
    end function read_elogit_ctrlfile

    !-------------------------------
    ! Dummy error handler
    !-------------------------------
    subroutine err_handle(err, code, called_from, custom_1, file_name, line_no)
        type(error_type), intent(inout) :: err
        integer, intent(in) :: code
        character(len = *), intent(in) :: called_from
        character(len = *), optional :: custom_1, file_name
        integer, optional :: line_no

        err%code = code
        write(err%message, '(A)') "Error in " // called_from
    end subroutine err_handle

    !-------------------------------
    ! Dummy comment skipper
    !-------------------------------
    integer(our_int) function skip_comment_lines(unit, current_line) result(answer)
        integer, intent(in) :: unit
        integer, intent(inout) :: current_line
        character(len = ctrl_line_width) :: line
        answer = RETURN_SUCCESS
        ! Dummy implementation: assume no comments
    end function skip_comment_lines

end module elogit_control_mod
