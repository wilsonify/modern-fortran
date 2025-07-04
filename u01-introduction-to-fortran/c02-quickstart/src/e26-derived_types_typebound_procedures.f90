module m_shapes
  implicit none
  private
  public :: t_square

  type :: t_square
    real :: side
  contains
    procedure :: area
  end type

contains

  ! Type-bound function to compute area
  real function area(self) result(res)
    class(t_square), intent(in) :: self
    res = self%side**2
  end function

end module m_shapes

program e26_derived_types_typebound_procedures
  use m_shapes
  implicit none

  type(t_square) :: sq
  real :: x

  ! Initialize side length
  sq%side = 0.5

  ! Compute area using type-bound function
  x = sq%area()

  print *, "Side length:", sq%side
  print *, "Area:", x

end program e26_derived_types_typebound_procedures
