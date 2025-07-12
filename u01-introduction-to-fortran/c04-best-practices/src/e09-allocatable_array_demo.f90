program allocatable_array_demo
  implicit none
  integer, parameter :: dp = kind(1.0d0)

  ! Declare an allocatable array
  real(dp), allocatable :: arr(:)

  ! Allocate with initialization using source
  allocate(arr(5), source=0.0_dp)
  print *, "After initial allocation:"
  call print_array(arr)

  ! Fill the array with some values
  call fill_array(arr)
  print *, "After filling the array:"
  call print_array(arr)

  ! Reallocate to larger size (demonstrate deallocation and reallocation)
  call resize_array(arr, 8)
  print *, "After resizing to 8 elements:"
  call print_array(arr)

  ! Pass to a procedure that allocates an allocatable dummy argument
  call allocate_inside(arr)
  print *, "After allocation inside procedure:"
  call print_array(arr)

  ! Clean up
  if (allocated(arr)) then
    deallocate(arr)
  end if

contains

  subroutine print_array(a)
    real(dp), intent(in) :: a(:)
    if (allocated(a)) then
      print *, a
    else
      print *, "Array not allocated."
    end if
  end subroutine print_array

  subroutine fill_array(a)
    real(dp), intent(inout), allocatable :: a(:)
    integer :: i
    do i = 1, size(a)
      a(i) = real(i*i, dp)
    end do
  end subroutine fill_array

  subroutine resize_array(var, new_size)
    real(dp), allocatable, intent(inout) :: var(:)
    integer, intent(in), optional :: new_size
    integer :: old_size, target_size
    real(dp), allocatable :: tmp(:)

    if (allocated(var)) then
      old_size = size(var)
      call move_alloc(var, tmp)
    else
      old_size = 0
    end if

    if (present(new_size)) then
      target_size = new_size
    else
      target_size = max(1, old_size + old_size/2 + 1)
    end if

    allocate(var(target_size))

    if (allocated(tmp)) then
      var(:min(old_size,target_size)) = tmp(:min(old_size,target_size))
    end if
  end subroutine resize_array

  subroutine allocate_inside(a)
    real(dp), allocatable, intent(out) :: a(:)
    allocate(a(3))
    a = [10.0_dp, 20.0_dp, 30.0_dp]
  end subroutine allocate_inside

end program allocatable_array_demo
