module mymath
  implicit none
contains

  function square(x) result(res)
    real, intent(in) :: x
    real :: res
    res = x * x
  end function square

  function cube(x) result(res)
    real, intent(in) :: x
    real :: res
    res = x * x * x
  end function cube

end module mymath
