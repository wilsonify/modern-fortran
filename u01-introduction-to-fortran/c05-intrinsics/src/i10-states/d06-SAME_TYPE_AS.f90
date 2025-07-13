program demo_same_type_as
  implicit none

  type :: base
  end type base

  type, extends(base) :: derived
  end type derived

  class(base), allocatable :: a, b
  logical :: same_type

  ! Allocate 'a' as base, and 'b' as derived
  allocate(base :: a)
  allocate(derived :: b)

  ! Check whether dynamic types match
  same_type = same_type_as(a, b)

  print *, "Are 'a' and 'b' of the same dynamic type? ", same_type

  ! Now allocate both as base
  deallocate(a, b)
  allocate(base :: a, b)

  same_type = same_type_as(a, b)

  print *, "Are 'a' and 'b' of the same dynamic type now? ", same_type

end program demo_same_type_as
