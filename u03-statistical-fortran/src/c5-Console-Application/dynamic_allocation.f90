module dynamic_allocation_mod
    use program_constants
    use error_handler
    implicit none

    interface dyn_alloc
        module procedure dyn_alloc_int
        module procedure dyn_alloc_real
        module procedure dyn_alloc_double
        module procedure dyn_alloc_double_2d
        module procedure dyn_alloc_logical
        module procedure dyn_alloc_char  ! allocatable deferred-length character arrays

    end interface

    interface dyn_dealloc
        module procedure dyn_dealloc_int
        module procedure dyn_dealloc_real
        module procedure dyn_dealloc_double
        module procedure dyn_dealloc_double_2d
        module procedure dyn_dealloc_logical
        module procedure dyn_dealloc_char

    end interface

contains

    ! Integer pointer 1D allocation
    integer function dyn_alloc_int(ptr, n, err) result(status)
        integer, pointer :: ptr(:)
        integer, intent(in) :: n
        type(error_type), intent(inout) :: err
        integer :: stat

        status = RETURN_SUCCESS
        if (associated(ptr)) deallocate(ptr)
        allocate(ptr(n), stat = stat)
        if (stat /= 0) then
            status = RETURN_FAIL
            nullify(ptr)
            call err_handle(err, 1001, &
                    custom_1 = "Allocation failed for integer pointer array", &
                    called_from = "dyn_alloc_int in dynamic_allocation_mod")
        end if
    end function dyn_alloc_int

    subroutine dyn_dealloc_int(ptr)
        integer, pointer :: ptr(:)
        if (associated(ptr)) deallocate(ptr)
        nullify(ptr)
    end subroutine dyn_dealloc_int


    ! Real pointer 1D allocation
    integer function dyn_alloc_real(ptr, n, err) result(status)
        real, pointer :: ptr(:)
        integer, intent(in) :: n
        type(error_type), intent(inout) :: err
        integer :: stat

        status = RETURN_SUCCESS
        if (associated(ptr)) deallocate(ptr)
        allocate(ptr(n), stat = stat)
        if (stat /= 0) then
            status = RETURN_FAIL
            nullify(ptr)
            call err_handle(err, 1002, &
                    custom_1 = "Allocation failed for real pointer array", &
                    called_from = "dyn_alloc_real in dynamic_allocation_mod")
        end if
    end function dyn_alloc_real

    subroutine dyn_dealloc_real(ptr)
        real, pointer :: ptr(:)
        if (associated(ptr)) deallocate(ptr)
        nullify(ptr)
    end subroutine dyn_dealloc_real


    ! Double precision pointer 1D allocation
    integer function dyn_alloc_double(ptr, n, err) result(status)
        double precision, pointer :: ptr(:)
        integer, intent(in) :: n
        type(error_type), intent(inout) :: err
        integer :: stat

        status = RETURN_SUCCESS
        if (associated(ptr)) deallocate(ptr)
        allocate(ptr(n), stat = stat)
        if (stat /= 0) then
            status = RETURN_FAIL
            nullify(ptr)
            call err_handle(err, 1003, &
                    custom_1 = "Allocation failed for double precision pointer array", &
                    called_from = "dyn_alloc_double in dynamic_allocation_mod")
        end if
    end function dyn_alloc_double

    subroutine dyn_dealloc_double(ptr)
        double precision, pointer :: ptr(:)
        if (associated(ptr)) deallocate(ptr)
        nullify(ptr)
    end subroutine dyn_dealloc_double


    ! Double precision pointer 2D allocation
    integer function dyn_alloc_double_2d(ptr, n1, n2, err) result(status)
        double precision, pointer :: ptr(:, :)
        integer, intent(in) :: n1, n2
        type(error_type), intent(inout) :: err
        integer :: stat

        status = RETURN_SUCCESS
        if (associated(ptr)) deallocate(ptr)
        allocate(ptr(n1, n2), stat = stat)
        if (stat /= 0) then
            status = RETURN_FAIL
            nullify(ptr)
            call err_handle(err, 1004, &
                    custom_1 = "Allocation failed for 2D double precision pointer array", &
                    called_from = "dyn_alloc_double_2d in dynamic_allocation_mod")
        end if
    end function dyn_alloc_double_2d

    subroutine dyn_dealloc_double_2d(ptr)
        double precision, pointer :: ptr(:, :)
        if (associated(ptr)) deallocate(ptr)
        nullify(ptr)
    end subroutine dyn_dealloc_double_2d


    ! Logical pointer 1D allocation
    integer function dyn_alloc_logical(ptr, n, err) result(status)
        logical, pointer :: ptr(:)
        integer, intent(in) :: n
        type(error_type), intent(inout) :: err
        integer :: stat

        status = RETURN_SUCCESS
        if (associated(ptr)) deallocate(ptr)
        allocate(ptr(n), stat = stat)
        if (stat /= 0) then
            status = RETURN_FAIL
            nullify(ptr)
            call err_handle(err, 1005, &
                    custom_1 = "Allocation failed for logical pointer array", &
                    called_from = "dyn_alloc_logical in dynamic_allocation_mod")
        end if
    end function dyn_alloc_logical

    subroutine dyn_dealloc_logical(ptr)
        logical, pointer :: ptr(:)
        if (associated(ptr)) deallocate(ptr)
        nullify(ptr)
    end subroutine dyn_dealloc_logical


    ! Allocatable deferred-length character array (arbitrary length)
    integer function dyn_alloc_char(ptr, n, lenval, err) result(status)
        character(len = :), allocatable :: ptr(:)
        integer, intent(in) :: n, lenval
        type(error_type), intent(inout) :: err
        integer :: stat
        character(len = lenval) :: mold_var

        status = RETURN_SUCCESS
        if (allocated(ptr)) deallocate(ptr)
        allocate(ptr(n), mold = mold_var, stat = stat)
        if (stat /= 0) then
            status = RETURN_FAIL
            if (allocated(ptr)) deallocate(ptr)
            call err_handle(err, 1006, &
                    custom_1 = "Allocation failed for allocatable character array", &
                    called_from = "dyn_alloc_char in dynamic_allocation_mod")
        end if
    end function dyn_alloc_char

    subroutine dyn_dealloc_char(ptr)
        character(len = :), allocatable :: ptr(:)
        if (allocated(ptr)) deallocate(ptr)
    end subroutine dyn_dealloc_char


end module dynamic_allocation_mod
