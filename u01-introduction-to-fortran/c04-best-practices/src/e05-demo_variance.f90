!> Demonstration program for computing variance.
program demo_variance
  use math_stats, only: variance
  use iso_fortran_env, only: dp => real64
  implicit none

  real(dp), dimension(5) :: data = [ 1.0_dp, 2.0_dp, 3.0_dp, 4.0_dp, 5.0_dp ]
  real(dp) :: result

  result = variance(data)
  print *, "Variance of sample: ", result

end program demo_variance
