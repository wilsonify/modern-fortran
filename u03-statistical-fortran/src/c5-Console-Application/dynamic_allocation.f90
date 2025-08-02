module dynamic_allocation_mod
    implicit none

    integer, parameter :: RETURN_SUCCESS = 0
    integer, parameter :: RETURN_FAIL = -1

contains

    !----------------------------------------------------------------
    ! Allocate integer pointer arrays
    integer function dyn_alloc_int(ptr, n) result(status)
        integer, pointer :: ptr(:)
        integer, intent(in) :: n
        status = RETURN_SUCCESS

        if (associated(ptr)) then
            deallocate(ptr)
        end if

        allocate(ptr(n), stat=status)
        if (status /= 0) then
            status = RETURN_FAIL
        end if
    end function dyn_alloc_int

    !----------------------------------------------------------------
    ! Allocate character(len=var_len) pointer arrays
    integer function dyn_alloc_char(ptr, n, var_len) result(status)
        integer, intent(in) :: n, var_len
        character(len=:), pointer :: ptr(:)
        integer :: i, stat

        status = RETURN_SUCCESS
        if (associated(ptr)) then
            do i = 1, size(ptr)
                if (associated(ptr(i))) nullify(ptr(i))
            end do
            deallocate(ptr)
        end if

        allocate(ptr(n), stat=stat)
        if (stat /= 0) then
            status = RETURN_FAIL
            return
        end if

        ! Set length of each character element
        do i = 1, n
            allocate(character(len=var_len) :: ptr(i), stat=stat)
            if (stat /= 0) then
                status = RETURN_FAIL
                return
            end if
        end do
    end function dyn_alloc_char

    !----------------------------------------------------------------
    ! Generic interface for dyn_alloc
    interface dyn_alloc
        module procedure dyn_alloc_int
        module procedure dyn_alloc_char
    end interface

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
    ! Deallocate character pointer arrays safely
    subroutine dyn_dealloc_char(ptr)
        character(len=:), pointer :: ptr(:)
        integer :: i

        if (associated(ptr)) then
            do i = 1, size(ptr)
                if (associated(ptr(i))) nullify(ptr(i))
            end do
            deallocate(ptr)
            nullify(ptr)
        end if
    end subroutine dyn_dealloc_char

    !----------------------------------------------------------------
    ! Generic interface for dyn_dealloc
    interface dyn_dealloc
        module procedure dyn_dealloc_int
        module procedure dyn_dealloc_char
    end interface

end module dynamic_allocation_mod
