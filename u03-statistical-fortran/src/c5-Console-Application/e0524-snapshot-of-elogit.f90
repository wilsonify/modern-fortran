
 ELOGIT: A simple program for logistic regression analysis #####
 written entirely in standard Fortran-95.
 For non-PC platforms, the value of "platform" may be
 changed to "UNIX" or "MAC", so that carriage returns are
 handled correctly.

program elogit
    use error_handler
    use program_constants
    use elogit_ctrlfile
    implicit none
    ! declare instances of various types
    type(error_type) :: err
    type(elogit_ctrlfile_type) :: ctrlfile
    ! additional variables and parameters for the console application
    character(len = *), parameter :: platform = "PC"
    character(len = 256) :: msg_string
    character(len = file_name_length) :: control_file_name
    ! Query the user for the name of the control file
    print "(A)", "Enter name of control file:"
    read(*, "(A)") control_file_name
    print "(A)", ""
    if(control_file_name == "") then
        call err_handle(err, 1000, &
                custom_1 = "No control file name specified.")
        goto 800
    end if
    ! read control file
    if(read_elogit_ctrlfile(control_file_name, ctrlfile, err) &
            == RETURN_FAIL) goto 800
    ! We’ll add more code here later
    800 continue
    ! report "OK" or error message
    if(err_msg_present(err)) then
        call err_get_msgs(err, msg_string, platform)
        print "(A)", trim(msg_string)
        print "(A)", "Aborted"
    else
        print "(A)", "OK"
    end if
end program elogit
