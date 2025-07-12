!> Statistical utilities interface.
!>
!> Defines interface for computing basic statistics.
module math_stats
  use iso_fortran_env, only: dp => real64
  implicit none
  private

  public :: variance

  !> Interface for the variance computation
  interface variance
    module function variance_1d(x) result(v)
      real(dp), intent(in) :: x(:)
      real(dp) :: v
    end function variance_1d
  end interface variance

end module math_stats
