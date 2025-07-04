module m_f_to_c
  use iso_c_binding, only: c_int
  implicit none

  ! Derived type with bind(c) for C interoperability
  type, bind(c) :: f_type
    integer(c_int) :: i
  end type

end module m_f_to_c

program e23_derived_types_bind_c
  use m_f_to_c
  implicit none

  type(f_type) :: var

  ! Initialize variable
  var%i = 42

  ! No output required for this interoperability example
end program e23_derived_types_bind_c
