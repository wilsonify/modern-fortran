program e09_allocatable_array_demo
    implicit none
    integer, parameter :: dp = kind(1.0d0)

    ! Declare allocatable array
    real(dp), allocatable :: arr(:)

    ! Initial allocation with values set to zero
    allocate(arr(5), source = 0.0_dp)
    print *, "After initial allocation:"
    call print_array(arr)

    ! Fill the array with square values
    call fill_with_squares(arr)
    print *, "After filling the array:"
    call print_array(arr)

    ! Resize the array (with value preservation)
    call resize_array(arr, 8)
    print *, "After resizing to 8 elements:"
    call print_array(arr)

    ! Reallocate inside procedure using intent(out)
    call allocate_in_procedure(arr)
    print *, "After allocation inside procedure:"
    call print_array(arr)

    ! Clean up explicitly
    if (allocated(arr)) deallocate(arr)

contains

    subroutine print_array(a)
        real(dp), intent(in) :: a(:)
        print *, a
    end subroutine print_array


    pure subroutine fill_with_squares(a)
        real(dp), intent(inout) :: a(:)
        integer :: i
        do i = 1, size(a)
            a(i) = real(i * i, dp)
        end do
    end subroutine fill_with_squares

    subroutine resize_array(var, new_size)
        real(dp), allocatable, intent(inout) :: var(:)
        integer, intent(in) :: new_size
        real(dp), allocatable :: tmp(:)
        integer :: copy_size

        ! Use move_alloc to transfer existing content
        if (allocated(var)) then
            call move_alloc(var, tmp)
        end if

        allocate(var(new_size), source = 0.0_dp)

        if (allocated(tmp)) then
            copy_size = min(new_size, size(tmp))
            var(:copy_size) = tmp(:copy_size)
        end if
    end subroutine resize_array

    subroutine allocate_in_procedure(a)
        real(dp), allocatable, intent(out) :: a(:)
        allocate(a(3))
        a = [10.0_dp, 20.0_dp, 30.0_dp]
    end subroutine allocate_in_procedure

end program e09_allocatable_array_demo
