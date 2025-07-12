!> Basic array operations for demonstration.
module math_array_ops
  use, intrinsic :: iso_fortran_env, only: dp
  implicit none
  private

  public :: fill_inverse_squares, print_vector, generate_inverse_squares

contains

  !> Fill array with inverse square values: 1/i^2
  subroutine fill_inverse_squares(r)
    real(dp), intent(out) :: r(:)
    integer :: i
    do i = 1, size(r)
      r(i) = 1.0_dp / real(i*i, dp)
    end do
  end subroutine fill_inverse_squares

  !> Return array of inverse squares using explicit-shape
  function generate_inverse_squares(n) result(r)
    integer, intent(in) :: n
    real(dp) :: r(n)
    integer :: i
    do i = 1, n
      r(i) = 1.0_dp / real(i*i, dp)
    end do
  end function generate_inverse_squares

  !> Print vector elements with their index
  subroutine print_vector(v)
    real(dp), intent(in) :: v(:)
    integer :: i
    do i = 1, size(v)
      print "(I2,2X,F10.6)", i, v(i)
    end do
  end subroutine print_vector

end module math_array_ops
