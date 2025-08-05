!ELOGIT:A simple program for logistic regression analysis #####
!written entirely in standard Fortran-95.
!For non-PC platforms, the value of "platform" may be
!changed to "UNIX" or "MAC", so that carriage returns are
!handled correctly.


!ELOGIT:A simple program for logistic regression analysis #####
!written entirely in standard Fortran-95.                     #####

program elogit
    use program_constants
    use error_handler
    use elogit_control_mod
    use elogit_session_load_mod
    use elogit_data_mod
    use elogit_data_io_mod

    implicit none

    !=== Type declarations ===
    type(error_type) :: err, warn
    type(elogit_ctrlfile_type) :: ctrlfile
    type(elogit_session_type) :: session

    !=== Local variables ===
    character(len = *), parameter :: platform = "PC"
    character(len = 256) :: msg_string
    character(len = file_name_length) :: control_file_name

    !=== Get control file name from user ===
    print "(A)", "Enter name of control file:"
    read(*, "(A)") control_file_name
    print "(A)", ""

    if (trim(control_file_name) == "") then
        call err_handle(err, 1000, custom_1 = "No control file name specified.")
        goto 800
    end if

    !=== Read control file ===
    if (read_elogit_ctrlfile(control_file_name, ctrlfile, err) == RETURN_FAIL) goto 800

    !=== Read data file ===
    if (read_elogit_datafile(ctrlfile%data_file_name, &
            ctrlfile%ncase, ctrlfile%nvar, ctrlfile%case_id_present, &
            session, err, warn) == RETURN_FAIL) goto 800

    !=== Read variable names file (if applicable) ===
    if (ctrlfile%names_file_present) then
        if (read_elogit_namesfile(ctrlfile%names_file_name, &
                ctrlfile%nvar, session, err, warn) == RETURN_FAIL) goto 800
    end if

    !=== Specify the model from control file ===
    if (ctrlfile%by_name) then
        if (put_elogit_response(ctrlfile%resp_name, session, err) == RETURN_FAIL) goto 800
        if (put_elogit_intercept(ctrlfile%intercept_present, session, err) == RETURN_FAIL) goto 800
        if (put_elogit_predictors(ctrlfile%pred_names, session, err) == RETURN_FAIL) goto 800
    else
        if (put_elogit_response(ctrlfile%resp_col, session, err) == RETURN_FAIL) goto 800
        if (put_elogit_intercept(ctrlfile%intercept_present, session, err) == RETURN_FAIL) goto 800
        if (put_elogit_predictors(ctrlfile%pred_col, session, err) == RETURN_FAIL) goto 800
    end if

    800 continue
    !=== Final output: report success or error ===
    if (err_msg_present(err)) then
        call err_get_msgs(err, msg_string, platform)
        print "(A)", trim(msg_string)
        print "(A)", "Aborted"
    else
        print "(A)", "OK"
    end if
end program elogit




