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
    ! Removed save_dataset argument
    ijunk = nullify_elogit_session(session, err)

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
