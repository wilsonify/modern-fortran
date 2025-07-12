module types
  implicit none
  integer, parameter :: dp = kind(1.0d0)
end module types

module integrals
  use types, only: dp
  implicit none
  private
  public :: simpson, integrable_function

  ! Abstract interface for integrable function callbacks
  abstract interface
    function integrable_function(x) result(func)
      import :: dp
      real(dp), intent(in) :: x
      real(dp) :: func
    end function integrable_function
  end interface

contains

  ! Simpson's rule integration over [a,b] with callback f
  function simpson(f, a, b) result(s)
    real(dp), intent(in) :: a, b
    procedure(integrable_function) :: f
    real(dp) :: s

    s = (b - a) / 6.0_dp * (f(a) + 4.0_dp * f((a + b)/2.0_dp) + f(b))
  end function simpson

end module integrals


module demo_functions
  use types, only: dp
  use integrals, only: simpson, integrable_function
  implicit none
  private
  public :: test_integral

contains

  subroutine test_integral(a, k)
    real(dp), intent(in) :: a, k
    real(dp), parameter :: pi = 3.14159265358979323846_dp

    print '(A, F10.6)', "Integral of f over [0, pi] = ", simpson(f, 0.0_dp, pi)
    print '(A, F10.6)', "Integral of f over [0, 2*pi] = ", simpson(f, 0.0_dp, 2.0_dp * pi)

  contains

    ! Nested callback function matching integrable_function interface
    function f(x) result(y)
      real(dp), intent(in) :: x
      real(dp) :: y
      y = a * sin(k * x)
    end function f

  end subroutine test_integral

end module demo_functions


program e11_callbacks_demo
  use types, only: dp
  use demo_functions, only: test_integral

  implicit none

  call test_integral(2.0_dp, 1.5_dp)

end program e11_callbacks_demo
