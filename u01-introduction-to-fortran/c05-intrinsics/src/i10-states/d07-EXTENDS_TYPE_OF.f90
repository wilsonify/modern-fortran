program demo_extends_type_of
  implicit none

  type :: base
  end type base

  type, extends(base) :: derived
  end type derived

  class(base), allocatable :: a
  class(base), allocatable :: mold
  logical :: is_extension

  ! Allocate 'a' as derived and 'mold' as base
  allocate(derived :: a)
  allocate(base :: mold)

  ! Test whether a is an extension of mold
  is_extension = extends_type_of(a, mold)
  print *, "Is 'a' an extension of 'mold'? ", is_extension

  ! Now allocate 'a' also as base
  deallocate(a)
  allocate(base :: a)

  is_extension = extends_type_of(a, mold)
  print *, "Is 'a' an extension of 'mold' now? ", is_extension

end program demo_extends_type_of
