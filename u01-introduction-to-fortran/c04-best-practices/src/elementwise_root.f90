module elementwise_root_mod
  use, intrinsic :: iso_fortran_env, only: dp
  implicit none
  private

  public :: nroot_elemental, nroot_vector, nroot_0d, nroot_2d, nroot_explicit

contains

  !> Elemental function: n-th root, works on scalars and arrays of any shape.
  pure elemental function nroot_elemental(n, x) result(y)
    integer, intent(in) :: n
    real(dp), intent(in) :: x
    real(dp) :: y
    y = x**(1._dp / n)
  end function nroot_elemental

  !> Vector version: n-th root operating on 1D arrays
  function nroot_vector(n, x) result(y)
    integer, intent(in) :: n
    real(dp), intent(in) :: x(:)
    real(dp) :: y(size(x))
    y = x**(1._dp / n)
  end function nroot_vector

  !> Scalar wrapper around vector version
  function nroot_0d(n, x) result(y)
    integer, intent(in) :: n
    real(dp), intent(in) :: x
    real(dp) :: y
    real(dp) :: tmp(1)
    tmp = nroot_vector(n, [x])
    y = tmp(1)
  end function nroot_0d

  !> 2D array wrapper around vector version
  function nroot_2d(n, x) result(y)
    integer, intent(in) :: n
    real(dp), intent(in) :: x(:, :)
    real(dp) :: y(size(x, 1), size(x, 2))
    y = reshape(nroot_vector(n, reshape(x, [size(x)])), [size(x, 1), size(x, 2)])
  end function nroot_2d

  !> Explicit-shape array version
  function nroot_explicit(n, k, x) result(y)
    integer, intent(in) :: n, k
    real(dp), intent(in) :: x(k)
    real(dp) :: y(k)
    y = x**(1._dp / n)
  end function nroot_explicit

end module elementwise_root_mod
