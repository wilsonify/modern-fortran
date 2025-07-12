module types
  implicit none
  integer, parameter :: dp = kind(1.0d0)
end module types


module integrals
  use types, only: dp
  implicit none
  private
  public :: simpson_work_array

contains

  real(dp) function simpson_work_array(f, a, b, data) result(s)
    real(dp), intent(in) :: a, b
    interface
      real(dp) function func(x, data)
        use types, only: dp
        implicit none
        real(dp), intent(in) :: x
        real(dp), intent(inout) :: data(:)
      end function func
    end interface
    procedure(func) :: f
    real(dp), intent(inout) :: data(:)

    s = (b - a) / 6 * (f(a, data) + 4 * f((a + b) / 2, data) + f(b, data))
  end function simpson_work_array

end module integrals


module tests
  use types, only: dp
  use integrals, only: simpson_work_array
  implicit none
  private
  public :: run_tests

contains

  real(dp) function f(x, data) result(y)
    real(dp), intent(in) :: x
    real(dp), intent(inout) :: data(:)
    real(dp) :: a, k

    a = data(1)
    k = data(2)

    y = a * sin(k * x)
  end function f

  subroutine run_tests()
    real(dp) :: data(2)
    real(dp), parameter :: pi = 3.14159265358979323846_dp

    data(1) = 2.0_dp  ! amplitude a
    data(2) = 3.0_dp  ! frequency k

    print '(A,F12.8)', "Integral over [0, pi]: ", simpson_work_array(f, 0._dp, pi, data)
    print '(A,F12.8)', "Integral over [0, 2*pi]: ", simpson_work_array(f, 0._dp, 2._dp * pi, data)
  end subroutine run_tests

end module tests


program demo_type_casting_callbacks
  use tests, only: run_tests
  implicit none

  call run_tests()

end program demo_type_casting_callbacks
