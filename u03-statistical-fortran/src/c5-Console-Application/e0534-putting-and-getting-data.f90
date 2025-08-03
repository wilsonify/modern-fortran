integer(our_int) function put_elogit_data_matrix(data_matrix, &
        session, err) result(answer)
    use program_constants
    use error_handler
    use elogit_data_mod

    ! Loads a data matrix into an ELOGIT session.
    ! When the data matrix is loaded, var_names and case_id are
    ! initialized to default values. If the loading fails for any
    ! reason, the entire ELOGIT session is nullified.
    implicit none
    ! declare arguments
    real(kind = our_dble), pointer :: data_matrix(:, :)
    type(elogit_session_type), intent(inout) :: session
    type(error_type), intent(inout) :: err
    ! declare local variables and parameters
    integer(kind = our_int) :: ijunk
    character(len = *), parameter :: subname = &
            "put_elogit_data_matrix"
    ! check arguments
    answer = RETURN_FAIL
    if(.not.associated(data_matrix)) goto 700
    ! nullify the entire session
    if(nullify_elogit_session(session, err) == RETURN_FAIL) &
            goto 800
    ! transfer dimensions to dataset, allocate pointers in dataset
    session%dataset%is_null = .false.
    session%dataset%ncase = size(data_matrix, 1)
    session%dataset%nvar = size(data_matrix, 2)
    if(dyn_alloc(session%dataset%data_matrix, &
            session%dataset%ncase, session%dataset%nvar, err) &
            == RETURN_FAIL) goto 800
    if(dyn_alloc(session%dataset%var_names, &
            session%dataset%nvar, err) == RETURN_FAIL) goto 800
    if(dyn_alloc(session%dataset%case_id, &
            session%dataset%ncase, err) == RETURN_FAIL) goto 800
    ! transfer contents from data_matrix to dataset%data_matrix
    session%dataset%data_matrix = data_matrix
    ! initialize var_names and case_id
    call assign_default_var_names(session%dataset)
    call assign_default_case_id(session%dataset)
    ! normal exit
    answer = RETURN_SUCCESS
    return
    ! error traps
    700 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "Input array is null.")
    ijunk = nullify_elogit_session(session, err)
    return
    800 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname)
    ijunk = nullify_elogit_session(session, err)
end function put_elogit_data_matrix


subroutine assign_default_var_names(dataset)
    ! assigns default values to dataset%var_names, assuming that
    ! the array has already been allocated
    implicit none
    ! declare arguments
    type(dataset_type), intent(inout) :: dataset
    ! declare local variables and parameters
    character(len = 12) :: sInt
    integer(kind = our_int) :: var
    ! begin
    do var = 1, dataset%nvar
        write(sInt, "(I12)") var
        sInt = adjustl(sInt)
        dataset%var_names(var) = "VAR_" // trim(sInt)

    end do
end subroutine assign_default_var_names


integer(our_int) function put_elogit_var_names(var_names, &
        session, err) result(answer)
    ! Loads an array of variable name strings into an ELOGIT
    ! session after a data matrix has already been loaded.
    ! Side effect: the rest of the ELOGIT session (everything after
    ! the model) will be nullified.
    implicit none
    ! declare arguments
    character(len = var_name_length), pointer :: var_names(:)
    type(elogit_session_type), intent(inout) :: session
    type(error_type), intent(inout) :: err
    ! declare local variables and parameters
    integer :: ijunk
    character(len = *), parameter :: subname = "put_elogit_var_names"
    ! check arguments
    answer = RETURN_FAIL
    if(session%dataset%is_null) goto 700
    if(.not.associated(var_names)) goto 800
    if(size(var_names) /= session%dataset%nvar) goto 810
    ! transfer contents from var_names to dataset%var_names
    session%dataset%var_names = var_names
    ! reset the other parts of the session
    ijunk = nullify_elogit_session(session, err, &
            save_dataset = .true.)
    ! normal exit
    answer = RETURN_SUCCESS
    return
    ! error traps
    700 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "You cannot load var_name strings", &
            custom_2 = "until a data matrix has been loaded.")
    return
    800 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "Input array is null.")
    return
    810 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "Size of input array does not conform", &
            custom_2 = "to the current dataset.")
end function put_elogit_var_names


integer(our_int) function get_elogit_var_names(var_names, &
        session, err) result(answer)
    ! Gets the var_names currently stored in an ELOGIT session
    implicit none
    ! declare arguments
    character(len = var_name_length), pointer :: var_names(:)
    type(elogit_session_type), intent(in) :: session
    type(error_type), intent(inout) :: err
    ! declare local variables and parameters
    character(len = *), parameter :: subname = "get_elogit_var_names"
    ! begin
    answer = RETURN_FAIL
    if(session%dataset%is_null) goto 700
    if(dyn_alloc(var_names, session%dataset%nvar, err) &
            == RETURN_FAIL) goto 800
    var_names = session%dataset%var_names
    ! normal exit
    answer = RETURN_SUCCESS
    return
    ! error traps
    700 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "No dataset has been loaded yet.")
    return
    800 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname)
end function get_elogit_var_names
