program e04_static_link
  use mymath
  implicit none

  real :: val, sq

  val = 3.0
  sq = square(val)
  print *, "Square of ", val, " is ", sq
end program e04_static_link
