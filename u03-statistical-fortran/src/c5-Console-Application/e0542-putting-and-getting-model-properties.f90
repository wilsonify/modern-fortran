
integer(our_int) function put_elogit_response_bycol(col, session, &
        err) result(answer)
    ! Declares which column in the dataset contains the response or
    ! y variable, and which column (if any) contains the n.

    !
    ! The input argument col is a pointer to an integer array.
    ! For ungrouped data, the array should have size 1; the only
    ! element should be the column number of the y-variable.
    ! For grouped data, the size should be 2, and the elements
    ! should be the column number for the y-variable, followed by
    ! the column number for the n-variable.
    !
    ! Also checks the dataset to make sure that all the y and n
    ! values are valid: 0.<=y<=1. for grouped data and 0.<=y<=n
    ! for ungrouped data.
    !
    ! Calling this procedure has the effect of resetting the
    ! predictors to a null (intercept-only) model.
    !
    ! Another side effect is that everything in the ELOGIT
    ! session after the data and model is nullified.
    !
    ! If this procedure fails for any reason, the model is
    ! nullified.
    implicit none
    ! declare arguments
    integer(kind = our_int), pointer :: col(:)
    type(elogit_session_type), intent(inout) :: session
    type(error_type), intent(inout) :: err
    ! declare local variables and parameters
    character(len = *), parameter :: subname = &
            "put_elogit_response_bycol"
    integer(kind = our_int) :: y, n, kase, ijunk
    real(kind = our_dble) :: ytmp, ntmp
    character(len = 12) :: sInt
    ! check arguments and set the y and n variables
    answer = RETURN_FAIL
    if(session%dataset%is_null) goto 700
    if(.not.associated(col)) goto 710
    if(size(col)==1) then
        y = col(1)
        if((y <= 0) .or. (y > session%dataset%nvar)) goto 740
        session%model%y_col = y
        session%model%grouped = .false.
    else if(size(col)==2) then
        y = col(1)
        n = col(2)
        if((n <= 0) .or. (n > session%dataset%nvar) .or. &
                (n == y)) goto 750
        session%model%y_col = y
        session%model%n_col = n
        session%model%grouped = .true.
    else
        goto 760
    end if
    ! set the predictors to a null (intercept-only) model
    session%model%intercept_present = .true.
    session%model%npred = 0
    if(dyn_dealloc(session%model%pred_col, err) &
            == RETURN_FAIL) goto 800
    ! check the data for y and n to make sure it looks okay
    do kase = 1, session%dataset%ncase
        write(sInt, "(I12)") kase
        sInt = adjustl(sInt)
        ytmp = session%dataset%data_matrix(kase, &
                session%model%y_col)
        if(session%model%grouped) then
            ntmp = session%dataset%data_matrix(kase, &
                    session%model%n_col)
            if(ntmp < 0.D0) goto 810
            if((ytmp < 0.D0) .or. (ytmp > ntmp)) goto 820
        else
            if((ytmp < 0.D0) .or. (ytmp > 1.D0)) goto 820
        end if
    end do
    session%model%is_null = .false.
    ! nullify everything in the session after the data and model
    ijunk = nullify_elogit_session(session, err, &
            save_dataset = .true., save_model = .true.)
    ! normal exit
    answer = RETURN_SUCCESS
    return
    ! error traps
    700 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "You cannot specify a model", &
            custom_2 = "until a dataset has been loaded.")
    goto 999
    710 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "Input array is null")
    goto 999
    740 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = &
                    "Invalid column number given for the y-variable")
    goto 999
    750 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = &
                    "Invalid column number given for the n-variable")
    goto 999
    760 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "Invalid size for input array")
    goto 999
    800 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname)
    goto 999
    810 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "Invalid data value for the n-variable", &
            custom_2 = "Case number = " // trim(sInt), &
            custom_3 = "Case id = " // &
                    trim(session%dataset%case_id(kase)))
    goto 999
    820 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "Invalid data value for the y-variable", &
            custom_2 = "Case number = " // trim(sInt), &
            custom_3 = "Case id = " // &
                    trim(session%dataset%case_id(kase)))
    goto 999
    ! cleanup if an error occurs
    999 continue
    ijunk = nullify_elogit_session(session, err, &
            save_dataset = .true.)
end function put_elogit_response_bycol
