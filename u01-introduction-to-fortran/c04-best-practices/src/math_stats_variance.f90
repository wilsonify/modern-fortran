!> Submodule that implements the variance calculation.
submodule (math_stats) math_stats_variance
  implicit none

contains

  module function variance_1d(x) result(v)
    real(dp), intent(in) :: x(:)
    real(dp) :: v
    real(dp) :: mean
    integer :: n

    n = size(x)
    if (n < 2) then
      v = 0.0_dp
    else
      mean = sum(x) / n
      v = sum((x - mean)**2) / (n - 1)
    end if
  end function variance_1d

end submodule math_stats_variance
