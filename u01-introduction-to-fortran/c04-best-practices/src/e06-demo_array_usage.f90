!> Demonstrates passing and returning arrays using modern Fortran practices.
program e06_demo_array_usage
  use math_array_ops
  use, intrinsic :: iso_fortran_env, only: dp
  implicit none

  real(dp) :: x(5)
  real(dp), allocatable :: y(:)

  ! Fill array via subroutine
  call fill_inverse_squares(x)
  print *, "Filled via subroutine:"
  call print_vector(x)

  ! Fill array via function return
  y = generate_inverse_squares(4)
  print *, "Filled via function:"
  call print_vector(y)

  ! Verify shape and size
  if (size(y) /= 4) error stop "Incorrect size of 'y'"
  if (any(shape(y) /= [4])) error stop "Incorrect shape of 'y'"

end program e06_demo_array_usage
