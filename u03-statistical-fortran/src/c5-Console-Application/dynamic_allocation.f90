module dynamic_allocation_mod
    implicit none

    integer, parameter :: RETURN_SUCCESS = 0
    integer, parameter :: RETURN_FAIL = -1
    integer, parameter :: var_name_length = 32  ! Must match elogit_control_mod

    interface dyn_alloc
        module procedure dyn_alloc_int
        module procedure dyn_alloc_char_32  ! for char(len=32)
    end interface

    interface dyn_dealloc
        module procedure dyn_dealloc_int
        module procedure dyn_dealloc_char
    end interface

contains

    function dyn_alloc_int(ptr, n, err) result(status)
        integer, pointer :: ptr(:)
        integer, intent(in) :: n
        type(error_type), intent(inout) :: err
        integer :: status
        allocate(ptr(n), stat=status)
        if (status /= 0) status = RETURN_FAIL
    end function dyn_alloc_int

    function dyn_alloc_char_32(ptr, n, err) result(status)
        character(len=var_name_length), pointer :: ptr(:)
        integer, intent(in) :: n
        type(error_type), intent(inout) :: err
        integer :: status
        allocate(ptr(n), stat=status)
        if (status /= 0) status = RETURN_FAIL
    end function dyn_alloc_char_32

    function dyn_dealloc_int(ptr, err) result(status)
        integer, pointer :: ptr(:)
        type(error_type), intent(inout) :: err
        integer :: status
        if (associated(ptr)) then
            deallocate(ptr, stat=status)
        else
            status = RETURN_SUCCESS
        end if
        if (status /= 0) status = RETURN_FAIL
    end function dyn_dealloc_int

    function dyn_dealloc_char(ptr, err) result(status)
        character(len=*), pointer :: ptr(:)
        type(error_type), intent(inout) :: err
        integer :: status
        if (associated(ptr)) then
            deallocate(ptr, stat=status)
        else
            status = RETURN_SUCCESS
        end if
        if (status /= 0) status = RETURN_FAIL
    end function dyn_dealloc_char

end module dynamic_allocation_mod
