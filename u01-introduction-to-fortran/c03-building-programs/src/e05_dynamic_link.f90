program e05_dynamic_link
  use mymath
  implicit none

  real :: val, cb

  val = 2.0
  cb = cube(val)
  print *, "Cube of ", val, " is ", cb
end program e05_dynamic_link
