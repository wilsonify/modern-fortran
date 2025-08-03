module pointer_allocation_mod
    use program_constants
    use error_handler
    implicit none
    private

    public :: int2_alloc

    character(len = *), parameter :: modname = "pointer_allocation_mod"

contains

    function int2_alloc(intArray, dim1, dim2, err) result(answer)
        ! Allocates an integer pointer array of rank 2
        implicit none
        ! return type
        integer(our_int) :: answer
        ! arguments
        integer(kind = our_int), pointer :: intArray(:, :)
        integer, intent(in) :: dim1, dim2
        type(error_type), intent(inout) :: err
        ! local variables
        integer :: status
        character(len = *), parameter :: subname = "int2_alloc"

        answer = RETURN_FAIL

        if (associated(intArray)) deallocate(intArray, stat = status)
        if (status /= 0) goto 800

        allocate(intArray(dim1, dim2), stat = status)
        if (status /= 0) goto 810

        answer = RETURN_SUCCESS
        return

800     call err_handle(err, 201, called_from = subname // " in MOD " // modname)
        return
810     call err_handle(err, 200, called_from = subname // " in MOD " // modname)
        return
    end function int2_alloc

end module pointer_allocation_mod
