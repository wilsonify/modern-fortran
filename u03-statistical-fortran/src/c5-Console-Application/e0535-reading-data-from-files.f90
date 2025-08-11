module elogit_data_io_mod
    use program_constants
    use error_handler
    use elogit_data_mod
    use elogit_control_mod
    use elogit_session_load_mod
    implicit none
    private

    ! Make public what you want others to access
    public :: read_elogit_datafile
    public :: read_elogit_namesfile

    ! Module name for error tracking
    character(len = *), parameter :: modname = "elogit_data_io_mod"

contains

    integer(kind = our_int) function read_elogit_datafile(&
            data_file_name, nkase, nvar, case_id_present, session, err, warn) result(answer)
        implicit none

        ! Constants for buffer sizes and file handle
        integer, parameter :: file_name_length = 1024
        integer, parameter :: case_id_length = 1024
        integer, parameter :: data_line_width = 1024
        integer, parameter :: data_file_handle = 42

        ! Inputs
        character(len = file_name_length), intent(in) :: data_file_name
        integer(kind = our_int), intent(in) :: nkase, nvar
        logical, intent(in) :: case_id_present
        type(elogit_session_type), intent(inout) :: session
        type(error_type), intent(inout) :: err
        type(error_type), intent(inout), optional :: warn

        ! Local arrays
        real(kind = our_dble) :: data_matrix(nkase, nvar)
        character(len = case_id_length) :: case_id(nkase)
        character(len = data_line_width) :: line

        ! Locals
        integer(kind = our_int) :: kase, var, posn, current_line, ijunk
        logical :: truncate_warn
        character(len = *), parameter :: subname = "read_elogit_datafile"

        ! Initialize
        answer = RETURN_FAIL
        if (data_file_name == "") goto 700
        if (nkase <= 0) goto 710
        if (nvar <= 0) goto 720

        ! Open data file
        open(unit = data_file_handle, file = data_file_name, status = "old", err = 810)
        current_line = 0

        ! Skip comments
        if (skip_comment_lines(data_file_handle, current_line) == RETURN_FAIL) goto 900

        ! Read file contents
        truncate_warn = .false.
        kase = 0
        do
            current_line = current_line + 1
            read(unit = data_file_handle, fmt = "(A)", err = 900, end = 900) line
            if (line == "") goto 900

            kase = kase + 1
            if (case_id_present) then
                line = adjustl(line)
                posn = index(line, " ") - 1
                if (posn > case_id_length) truncate_warn = .true.
                case_id(kase) = line(1:posn)
                line = line(posn + 1:)
            end if

            read(line, *, err = 900, end = 900) (data_matrix(kase, var), var = 1, nvar)
            if (kase == nkase) exit
        end do

        ! Store matrix and case IDs into session object
        if (put_elogit_data_matrix(data_matrix, nkase, nvar, session, err) == RETURN_FAIL) goto 800
        if (case_id_present) then
            if (put_elogit_case_id(case_id, session, err) == RETURN_FAIL) goto 800
        end if

        ! Optional warning if truncation occurred
        if (present(warn)) then
            if (truncate_warn) then
                call err_handle(warn, 1000, &
                        called_from = subname // " in MOD " // modname, &
                        custom_1 = "One or more case identifiers were truncated.")
            end if
        end if

        answer = RETURN_SUCCESS
        goto 999

        700     call err_handle(err, 1000, &
                called_from = subname // " in MOD " // modname, &
                custom_1 = "No data file name specified.")
        goto 999

        710     call err_handle(err, 1000, &
                called_from = subname // " in MOD " // modname, &
                custom_1 = "Number of cases not positive.")
        goto 999

        720     call err_handle(err, 1000, &
                called_from = subname // " in MOD " // modname, &
                custom_1 = "Number of variables not positive.")
        goto 999

        800     call err_handle(err, 1000, &
                called_from = subname // " in MOD " // modname)
        goto 999

        810     call err_handle(err, 1, &
                called_from = subname // " in MOD " // modname, &
                file_name = data_file_name)
        goto 999

        900     call err_handle(err, 3, &
                called_from = subname // " in MOD " // modname, &
                file_name = data_file_name, line_no = current_line)
        goto 999

        999     continue
        close(unit = data_file_handle)
        if (answer == RETURN_FAIL) ijunk = nullify_elogit_session(session, err)
    end function read_elogit_datafile

    integer(kind = our_int) function read_elogit_namesfile(&
            names_file_name, nvar, session, err, warn) result(answer)
        implicit none

        ! Constants
        integer, parameter :: file_name_length = 1024
        integer, parameter :: var_name_length = 32
        integer, parameter :: names_line_width = 1024
        integer, parameter :: names_file_handle = 43

        ! Inputs
        character(len = file_name_length), intent(in) :: names_file_name
        integer(kind = our_int), intent(in) :: nvar
        type(elogit_session_type), intent(inout) :: session
        type(error_type), intent(inout) :: err
        type(error_type), intent(inout), optional :: warn

        ! Locals
        character(len = var_name_length) :: var_names(nvar)
        character(len = names_line_width) :: line
        integer(kind = our_int) :: ivar, current_line, ijunk
        logical :: truncate_warn
        character(len = *), parameter :: subname = "read_elogit_namesfile"

        ! Init
        answer = RETURN_FAIL
        truncate_warn = .false.

        if (names_file_name == "") goto 700
        if (nvar <= 0) goto 710

        ! Open file
        open(unit = names_file_handle, file = names_file_name, status = "old", err = 800)
        current_line = 0

        ! Skip comments
        if (skip_comment_lines(names_file_handle, current_line) == RETURN_FAIL) goto 900

        ! Read nvar names
        do ivar = 1, nvar
            current_line = current_line + 1
            read(names_file_handle, "(A)", err = 900, end = 900) line
            line = adjustl(line)
            if (len_trim(line) > var_name_length) truncate_warn = .true.
            var_names(ivar) = line(1:min(len_trim(line), var_name_length))
        end do

        ! Store names in session
        if (put_elogit_var_names(var_names, session, err) == RETURN_FAIL) goto 800

        ! Optional truncation warning
        if (present(warn)) then
            if (truncate_warn) then
                call err_handle(warn, 1000, &
                        called_from = subname // " in MOD " // modname, &
                        custom_1 = "One or more variable names were truncated.")
            end if
        end if

        answer = RETURN_SUCCESS
        goto 999

        700     call err_handle(err, 1000, called_from = subname // " in MOD " // modname, &
                custom_1 = "No names file name specified.")
        goto 999

        710     call err_handle(err, 1000, called_from = subname // " in MOD " // modname, &
                custom_1 = "Number of variables not positive.")
        goto 999

        800     call err_handle(err, 1, called_from = subname // " in MOD " // modname, &
                file_name = names_file_name)
        goto 999

        900     call err_handle(err, 3, called_from = subname // " in MOD " // modname, &
                file_name = names_file_name, line_no = current_line)
        goto 999

        999     continue
        close(unit = names_file_handle)
        if (answer == RETURN_FAIL) ijunk = nullify_elogit_session(session, err)
    end function read_elogit_namesfile

end module elogit_data_io_mod
