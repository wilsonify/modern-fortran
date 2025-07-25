program test_map_square
  use iso_fortran_env, only: i4 => int32
  use functional               ! Your functional library module providing map()
  implicit none

  integer(i4), dimension(5) :: input_array = [1, 2, 3, 4, 5]
  integer(i4), dimension(5) :: output_array
  integer(i4), dimension(5) :: expected_array = [1, 4, 9, 16, 25]
  logical :: passed
  integer :: i

  ! Call map with the square function
  output_array = map(square, input_array)

  ! Compare output_array to expected_array
  passed = all(output_array == expected_array)

  if (passed) then
    print *, 'Test PASSED: map(square, input_array) produced expected results.'
  else
    print *, 'Test FAILED: output did not match expected results.'
    print *, 'Expected:', expected_array
    print *, 'Got:     ', output_array
  end if

contains

  pure function square(x) result(res)
    integer(i4), intent(in) :: x
    integer(i4) :: res
    res = x * x
  end function square

end program test_map_square
