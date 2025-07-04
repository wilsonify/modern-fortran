program e21_derived_types_basic
  implicit none

  ! Define the derived type
  type :: t_pair
    integer :: i
    real :: x
  end type

  ! Declare a variable of derived type
  type(t_pair) :: pair

  ! Initialize using constructor with positional arguments
  pair = t_pair(1, 0.5)

  ! Print members for test verification
  print *, "pair%i =", pair%i, "pair%x =", pair%x

end program e21_derived_types_basic
