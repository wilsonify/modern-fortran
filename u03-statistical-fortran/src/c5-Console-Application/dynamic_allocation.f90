module dynamic_allocation_mod
    implicit none

    integer, parameter :: RETURN_SUCCESS = 0
    integer, parameter :: RETURN_FAIL = -1

    interface dyn_alloc
        module procedure dyn_alloc_int
        module procedure dyn_alloc_char
    end interface

    interface dyn_dealloc
        module procedure dyn_dealloc_int
        module procedure dyn_dealloc_char
    end interface

contains

    !----------------------------------------------------------------
    ! Allocate integer pointer arrays
    integer function dyn_alloc_int(ptr, n) result(status)
        integer, pointer :: ptr(:)
        integer, intent(in) :: n
        status = RETURN_SUCCESS

        if (associated(ptr)) then
            deallocate(ptr)
            nullify(ptr)
        end if

        allocate(ptr(n), stat = status)
        if (status /= 0) status = RETURN_FAIL
    end function dyn_alloc_int

    !----------------------------------------------------------------
    integer function dyn_alloc_char(ptr, n, var_len) result(status)
        integer, intent(in) :: n, var_len
        character(len = :), allocatable :: ptr(:)
        character(len = var_len) :: mold_var
        integer :: i, stat

        status = RETURN_SUCCESS

        if (allocated(ptr)) then
            deallocate(ptr)
        end if

        mold_var = ''  ! length var_len filled with spaces

        allocate(ptr(n), mold = mold_var, stat = stat)
        if (stat /= 0) then
            status = RETURN_FAIL
            return
        end if

        do i = 1, n
            allocate(character(len = var_len) :: ptr(i), stat = stat)
            if (stat /= 0) then
                status = RETURN_FAIL
                return
            end if
        end do
    end function dyn_alloc_char

    !----------------------------------------------------------------
    ! Deallocate integer pointer arrays safely
    subroutine dyn_dealloc_int(ptr)
        integer, pointer :: ptr(:)
        if (associated(ptr)) then
            deallocate(ptr)
            nullify(ptr)
        end if
    end subroutine dyn_dealloc_int

    !----------------------------------------------------------------
    ! Deallocate allocatable deferred-length character arrays safely
    subroutine dyn_dealloc_char(ptr)
        character(len = :), allocatable :: ptr(:)
        if (allocated(ptr)) then
            deallocate(ptr)
        end if
    end subroutine dyn_dealloc_char

end module dynamic_allocation_mod
