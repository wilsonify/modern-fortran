program demo_sum_of_squares
  use mod_math, only: sum_of_squares
  implicit none

  real :: data(5)
  real :: result

  data = [1.0, 2.0, 3.0, 4.0, 5.0]

  result = sum_of_squares(data)

  print *, "Sum of squares:", result

end program demo_sum_of_squares
