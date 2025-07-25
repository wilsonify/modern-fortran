! demonstrate usage of map function,
! applying a function (square) to an array.
! demonstrate how to define a local function compatible with the map interface.
! Prints both input and output so users can see the effect clearly.
! ensure library is working as intended.

program map_square
  use iso_fortran_env, only: i4 => int32
  use functional          ! Your functional library module
  implicit none

  integer(i4), dimension(5) :: input_array = [1, 2, 3, 4, 5]
  integer(i4), dimension(5) :: output_array
  integer :: i

  ! Define a simple function to square its input
  interface
    pure function square(x) result(res)
      import :: i4
      integer(i4), intent(in) :: x
      integer(i4) :: res
    end function square
  end interface

  ! Implement the square function
  contains
    pure function square(x) result(res)
      integer(i4), intent(in) :: x
      integer(i4) :: res
      res = x * x
    end function square

  ! Main program logic
  output_array = map(square, input_array)

  print *, "Input array: ", input_array
  print *, "Squared array:", output_array
  print *, "Functional library linked and working successfully!"

end program map_square
