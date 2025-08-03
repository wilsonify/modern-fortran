function put_elogit_data_matrix(data_matrix, session, err) result(answer)
    use program_constants
    use error_handler
    use elogit_data_mod
    use dynamic_allocation_mod
    implicit none
    integer(our_int) :: answer
    real(kind = our_dble), pointer :: data_matrix(:, :)
    type(elogit_session_type), intent(inout) :: session
    type(error_type), intent(inout) :: err


    integer(kind = our_int) :: ijunk
    character(len = *), parameter :: subname = "put_elogit_data_matrix"

    answer = RETURN_FAIL
    if (.not. associated(data_matrix)) goto 700
    if (nullify_elogit_session(session, err) == RETURN_FAIL) goto 800

    session%dataset%is_null = .false.
    session%dataset%ncase = size(data_matrix, 1)
    session%dataset%nvar = size(data_matrix, 2)

    if (dyn_alloc(session%dataset%data_matrix, session%dataset%ncase, session%dataset%nvar, err) == RETURN_FAIL) goto 800
    if (dyn_alloc(session%dataset%var_names, session%dataset%nvar, err) == RETURN_FAIL) goto 800
    if (dyn_alloc(session%dataset%case_id, session%dataset%ncase, err) == RETURN_FAIL) goto 800

    session%dataset%data_matrix = data_matrix
    call assign_default_var_names(session%dataset)
    call assign_default_case_id(session%dataset)

    answer = RETURN_SUCCESS
    return

700 call err_handle(err, 1000, called_from = subname // " in MOD elogit_data_mod", custom_1 = "Input array is null.")
    ijunk = nullify_elogit_session(session, err)
    return
800 call err_handle(err, 1000, called_from = subname // " in MOD elogit_data_mod")
    ijunk = nullify_elogit_session(session, err)
end function put_elogit_data_matrix


function put_elogit_var_names(var_names, session, err) result(answer)
    use elogit_data_mod
    use error_handler
    use program_constants
    implicit none
    integer(our_int) :: answer
    character(len = var_name_length), pointer :: var_names(:)
    type(elogit_session_type), intent(inout) :: session
    type(error_type), intent(inout) :: err

    integer :: ijunk
    character(len = *), parameter :: subname = "put_elogit_var_names"

    answer = RETURN_FAIL
    if (session%dataset%is_null) goto 700
    if (.not. associated(var_names)) goto 800
    if (size(var_names) /= session%dataset%nvar) goto 810

    session%dataset%var_names = var_names
    ijunk = nullify_elogit_session(session, err, save_dataset = .true.)

    answer = RETURN_SUCCESS
    return

700 call err_handle(err, 1000, called_from = subname // " in MOD elogit_data_mod", &
    custom_1 = "You cannot load var_name strings", custom_2 = "until a data matrix has been loaded.")
    return
800 call err_handle(err, 1000, called_from = subname // " in MOD elogit_data_mod", &
    custom_1 = "Input array is null.")
    return
810 call err_handle(err, 1000, called_from = subname // " in MOD elogit_data_mod", &
    custom_1 = "Size of input array does not conform", custom_2 = "to the current dataset.")
end function put_elogit_var_names


function get_elogit_var_names(var_names, session, err) result(answer)
    use elogit_data_mod
    use error_handler
    use program_constants
    implicit none
    integer(our_int) :: answer
    character(len = var_name_length), pointer :: var_names(:)
    type(elogit_session_type), intent(in) :: session
    type(error_type), intent(inout) :: err

    character(len = *), parameter :: subname = "get_elogit_var_names"

    answer = RETURN_FAIL
    if (session%dataset%is_null) goto 700
    if (dyn_alloc(var_names, session%dataset%nvar, err) == RETURN_FAIL) goto 800

    var_names = session%dataset%var_names
    answer = RETURN_SUCCESS
    return

700 call err_handle(err, 1000, called_from = subname // " in MOD elogit_data_mod", &
    custom_1 = "No dataset has been loaded yet.")
    return
800 call err_handle(err, 1000, called_from = subname // " in MOD elogit_data_mod")
end function get_elogit_var_names
