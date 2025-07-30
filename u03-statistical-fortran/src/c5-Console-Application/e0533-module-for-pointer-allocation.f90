!##################################################################
integer(our_int) function int2_alloc(intArray, dim1, dim2, err) &
        result(answer)
    ! Allocates an integer array of rank 2
    implicit none
    ! declare required arguments
    integer(kind = our_int), pointer :: intArray(:, :)
    integer, intent(in) :: dim1, dim2
    type(error_type), intent(inout) :: err
    ! declare local variables and parameters
    integer :: status
    character(len = *), parameter :: subname = "int2_alloc"
    ! begin
    answer = RETURN_FAIL
    if(associated(intArray)) deallocate(intArray, stat = status)
    if(status /= 0) goto 800
    allocate(intArray(dim1, dim2), stat = status)
    if(status /= 0) goto 810
    ! normal exit
    answer = RETURN_SUCCESS
    return
    ! error traps
    800 call err_handle(err, 201, &
            called_from = subname // " in MOD " // modname)
    return
    810 call err_handle(err, 200, &
            called_from = subname // " in MOD " // modname)
    return
end function int2_alloc
!##################################################################