integer(kind = our_int) function read_elogit_datafile(&
        data_file_name, nkase, nvar, case_id_present, session, err, &
        warn) result(answer)
    use program_constants
    use error_handler
    use elogit_data_mod
    ! Reads a data matrix from a data file and stores it in an
    ! ELOGIT session. If the operation fails for any reason, the
    ! session is nullified and the returned value is RETURN_FAIL.
    ! Generates an optional warning message if case_id strings had
    ! to be truncated.
    implicit none
    ! declare required arguments
    character(len = file_name_length), intent(in) :: data_file_name
    integer(kind = our_int), intent(in) :: nkase, nvar
    logical, intent(in) :: case_id_present
    type(elogit_session_type), intent(inout) :: session
    type(error_type), intent(inout) :: err
    ! declare optional arguments
    type(error_type), intent(inout), optional :: warn
    ! declare local variables and parameters
    real(kind = our_dble), pointer :: data_matrix(:, :)
    character(len = case_id_length), pointer :: case_id(:)
    character(len = data_line_width) :: line

    integer(kind = our_int) :: kase, var, posn, current_line, ijunk
    logical :: truncate_warn
    character(len = *), parameter :: subname = "read_elogit_datafile"
    ! check the arguments
    answer = RETURN_FAIL
    if(data_file_name == "") goto 700
    if(nkase <= 0) goto 710
    if(nvar <= 0) goto 720
    ! allocate data_matrix and case_id, if necessary
    if(dyn_alloc(data_matrix, nkase, nvar, err) == RETURN_FAIL) &
            goto 800
    if(case_id_present) then
        if(dyn_alloc(case_id, nkase, err) == RETURN_FAIL) goto 800
    end if
    ! open the data file and ignore comment lines
    open(unit = data_file_handle, file = data_file_name, &
            status = "old", err = 810)
    current_line = 0
    if(skip_comment_lines(data_file_handle, current_line) &
            == RETURN_FAIL) goto 900
    ! read data
    truncate_warn = .false.
    kase = 0
    do
        current_line = current_line + 1
        read(unit = data_file_handle, fmt = "(A)", err = 900, end = 900) line
        if(line == "") goto 900
        ! no blank lines allowed
        kase = kase + 1
        if(case_id_present) then
            line = adjustl(line)
            posn = index(line, " ") - 1 ! length of current case_id
            if(posn > case_id_length) truncate_warn = .true.
            case_id(kase) = line(1:posn)
            line = line(posn + 1:)
            ! remove case_id from line
        end if
        read(line, *, err = 900, end = 900) &
                (data_matrix(kase, var), var = 1, nvar)
        if(kase == nkase) exit
    end do
    ! load the data matrix
    if(put_elogit_data_matrix(data_matrix, session, err) == &
            RETURN_FAIL) goto 800
    ! load the case_id, if present
    if(case_id_present) then
        if(put_elogit_case_id(case_id, session, err) == &
                RETURN_FAIL) goto 800
    end if
    ! issue warnings, if warranted
    if(present(warn)) then
        if(truncate_warn) &
                call err_handle(warn, 1000, &
                        called_from = subname // " in MOD " // modname, &
                        custom_1 = &

                                "One or more case identifiers were truncated.")
    end if
    ! normal exit
    answer = RETURN_SUCCESS
    goto 999
    ! error traps
    700 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "No data file name specified.")
    goto 999
    710 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "Number of cases not positive.")
    goto 999
    720 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "Number of variables not positive.")
    goto 999
    800 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname)
    goto 999
    810 call err_handle(err, 1, &
            called_from = subname // " in MOD " // modname, &
            file_name = data_file_name)
    goto 999
    900 call err_handle(err, 3, &
            called_from = subname // " in MOD " // modname, &
            file_name = data_file_name, line_no = current_line)
    goto 999
    ! final cleanup
    999 continue
    close(unit = data_file_handle)
    if(answer == RETURN_FAIL) &
            ijunk = nullify_elogit_session(session, err)
    ijunk = dyn_dealloc(data_matrix, err)
    ijunk = dyn_dealloc(case_id, err)
end function read_elogit_datafile
