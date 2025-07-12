!> Implementation of sum_of_squares
submodule (mod_math) mod_math_square
  implicit none

contains

  module function sum_sq(arr) result(res)
    real, intent(in) :: arr(:)
    real :: res

    res = sum(arr**2)
  end function sum_sq

end submodule mod_math_square
