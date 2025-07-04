program e22_derived_types_sequence
  implicit none

  ! Define derived type with sequence attribute
  type :: t_pair
    sequence
    integer :: i
    real :: x
  end type

  type(t_pair) :: pair

  ! Initialize with positional arguments
  pair = t_pair(1, 0.5)

  ! Print members for test verification
  print *, "pair%i =", pair%i, "pair%x =", pair%x

end program e22_derived_types_sequence
