module dynamic_allocation_mod
    implicit none

    integer, parameter :: RETURN_SUCCESS = 0
    integer, parameter :: RETURN_FAIL = -1

    interface dyn_alloc
        module procedure dyn_alloc_int
        module procedure dyn_alloc_real
        module procedure dyn_alloc_double
        module procedure dyn_alloc_logical
        module procedure dyn_alloc_char          ! allocatable character(:)
        module procedure dyn_alloc_char_fixed32  ! pointer character(:), len=32
    end interface

    interface dyn_dealloc
        module procedure dyn_dealloc_int
        module procedure dyn_dealloc_real
        module procedure dyn_dealloc_double
        module procedure dyn_dealloc_logical
        module procedure dyn_dealloc_char
        module procedure dyn_dealloc_char_fixed32
    end interface

contains

    !----------------------------------------
    ! Allocate integer pointer array
    integer function dyn_alloc_int(ptr, n) result(status)
        integer, pointer :: ptr(:)
        integer, intent(in) :: n
        integer :: stat

        status = RETURN_SUCCESS
        if (associated(ptr)) deallocate(ptr)
        allocate(ptr(n), stat = stat)
        if (stat /= 0) then
            status = RETURN_FAIL
            nullify(ptr)
        end if
    end function dyn_alloc_int

    ! Deallocate integer pointer array
    subroutine dyn_dealloc_int(ptr)
        integer, pointer :: ptr(:)
        if (associated(ptr)) deallocate(ptr)
        nullify(ptr)
    end subroutine dyn_dealloc_int

    !----------------------------------------
    ! Allocate real pointer array
    integer function dyn_alloc_real(ptr, n) result(status)
        real, pointer :: ptr(:)
        integer, intent(in) :: n
        integer :: stat

        status = RETURN_SUCCESS
        if (associated(ptr)) deallocate(ptr)
        allocate(ptr(n), stat = stat)
        if (stat /= 0) then
            status = RETURN_FAIL
            nullify(ptr)
        end if
    end function dyn_alloc_real

    subroutine dyn_dealloc_real(ptr)
        real, pointer :: ptr(:)
        if (associated(ptr)) deallocate(ptr)
        nullify(ptr)
    end subroutine dyn_dealloc_real

    !----------------------------------------
    ! Allocate double precision pointer array
    integer function dyn_alloc_double(ptr, n) result(status)
        double precision, pointer :: ptr(:)
        integer, intent(in) :: n
        integer :: stat

        status = RETURN_SUCCESS
        if (associated(ptr)) deallocate(ptr)
        allocate(ptr(n), stat = stat)
        if (stat /= 0) then
            status = RETURN_FAIL
            nullify(ptr)
        end if
    end function dyn_alloc_double

    subroutine dyn_dealloc_double(ptr)
        double precision, pointer :: ptr(:)
        if (associated(ptr)) deallocate(ptr)
        nullify(ptr)
    end subroutine dyn_dealloc_double

    !----------------------------------------
    ! Allocate logical pointer array
    integer function dyn_alloc_logical(ptr, n) result(status)
        logical, pointer :: ptr(:)
        integer, intent(in) :: n
        integer :: stat

        status = RETURN_SUCCESS
        if (associated(ptr)) deallocate(ptr)
        allocate(ptr(n), stat = stat)
        if (stat /= 0) then
            status = RETURN_FAIL
            nullify(ptr)
        end if
    end function dyn_alloc_logical

    subroutine dyn_dealloc_logical(ptr)
        logical, pointer :: ptr(:)
        if (associated(ptr)) deallocate(ptr)
        nullify(ptr)
    end subroutine dyn_dealloc_logical

    !----------------------------------------
    ! Allocate allocatable character array with deferred length
    integer function dyn_alloc_char(ptr, n, lenval) result(status)
        character(len = :), allocatable :: ptr(:)
        integer, intent(in) :: n, lenval
        integer :: stat
        character(len = lenval) :: mold_var

        status = RETURN_SUCCESS
        if (allocated(ptr)) deallocate(ptr)
        allocate(ptr(n), mold = mold_var, stat = stat)
        if (stat /= 0) then
            status = RETURN_FAIL
            if (allocated(ptr)) deallocate(ptr)
        end if
    end function dyn_alloc_char

    subroutine dyn_dealloc_char(ptr)
        character(len = :), allocatable :: ptr(:)
        if (allocated(ptr)) deallocate(ptr)
    end subroutine dyn_dealloc_char

    !----------------------------------------
    ! Allocate fixed-length (len=32) character pointer array
    integer function dyn_alloc_char_fixed32(ptr, n) result(status)
        character(len = 32), pointer :: ptr(:)
        integer, intent(in) :: n
        integer :: stat

        status = RETURN_SUCCESS
        if (associated(ptr)) deallocate(ptr)
        allocate(ptr(n), stat = stat)
        if (stat /= 0) then
            status = RETURN_FAIL
            nullify(ptr)
        end if
    end function dyn_alloc_char_fixed32

    subroutine dyn_dealloc_char_fixed32(ptr)
        character(len = 32), pointer :: ptr(:)
        if (associated(ptr)) deallocate(ptr)
        nullify(ptr)
    end subroutine dyn_dealloc_char_fixed32
    !----------------------------------------
    ! Nullify ELOGIT session
    integer function nullify_elogit_session(session, err) result(status)
        use iso_fortran_env, only : int32
        implicit none
        type(elogit_session_type), intent(inout) :: session
        type(error_type), intent(inout) :: err
        integer :: stat

        status = RETURN_SUCCESS

        ! Nullify dataset (or other allocatables/pointers inside session)
        if (associated(session%case_ids)) then
            deallocate(session%case_ids, stat = stat)
            if (stat /= 0) status = RETURN_FAIL
            nullify(session%case_ids)
        end if

        if (allocated(session%var_names)) then
            deallocate(session%var_names, stat = stat)
            if (stat /= 0) status = RETURN_FAIL
        end if

        if (associated(session%data)) then
            deallocate(session%data, stat = stat)
            if (stat /= 0) status = RETURN_FAIL
            nullify(session%data)
        end if

        ! Future-proofing: Reset other session fields if added
        session%is_null = .true.
    end function nullify_elogit_session

end module dynamic_allocation_mod
