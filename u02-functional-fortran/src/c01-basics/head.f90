pure integer(i1) function head_i1(x) result(head)
  !! Returns the first element of array `x`.
  !! This specific procedure is for 1-byte integers.
  !! Overloaded by generic procedure `head`.
  integer(i1), dimension(:), intent(in) :: x !! Input array
  head = x(1)
end function head_i1


pure integer(i2) function head_i2(x) result(head)
  !! Returns the first element of array `x`.
  !! This specific procedure is for 2-byte integers.
  !! Overloaded by generic procedure `head`.
  integer(i2), dimension(:), intent(in) :: x !! Input array
  head = x(1)
end function head_i2


pure integer(i4) function head_i4(x) result(head)
  !! Returns the first element of array `x`.
  !! This specific procedure is for 4-byte integers.
  !! Overloaded by generic procedure `head`.
  integer(i4), dimension(:), intent(in) :: x !! Input array
  head = x(1)
end function head_i4


pure integer(i8) function head_i8(x) result(head)
  !! Returns the first element of array `x`.
  !! This specific procedure is for 4-byte integers.
  !! Overloaded by generic procedure `head`.
  integer(i8), dimension(:), intent(in) :: x !! Input array
  head = x(1)
end function head_i8


pure real(r4) function head_r4(x) result(head)
  !! Returns the first element of array `x`.
  !! This specific procedure is for 4-byte reals.
  !! Overloaded by generic procedure `head`.
  real(r4), dimension(:), intent(in) :: x !! Input array
  head = x(1)
end function head_r4


pure real(r8) function head_r8(x) result(head)
  !! Returns the first element of array `x`.
  !! This specific procedure is for 8-byte reals.
  !! Overloaded by generic procedure `head`.
  real(r8), dimension(:), intent(in) :: x !! Input array
  head = x(1)
end function head_r8


pure real(r16) function head_r16(x) result(head)
  !! Returns the first element of array `x`.
  !! This specific procedure is for 16-byte reals.
  !! Overloaded by generic procedure `head`.
  real(r16), dimension(:), intent(in) :: x !! Input array
  head = x(1)
end function head_r16


pure complex(r4) function head_c4(x) result(head)
  !! Returns the first element of array `x`.
  !! This specific procedure is for 4-byte complex reals.
  !! Overloaded by generic procedure `head`.
  complex(r4), dimension(:), intent(in) :: x !! Input array
  head = x(1)
end function head_c4


pure complex(r8) function head_c8(x) result(head)
  !! Returns the first element of array `x`.
  !! This specific procedure is for 8-byte complex reals.
  !! Overloaded by generic procedure `head`.
  complex(r8), dimension(:), intent(in) :: x !! Input array
  head = x(1)
end function head_c8


pure complex(r16) function head_c16(x) result(head)
  !! Returns the first element of array `x`.
  !! This specific procedure is for 16-byte complex reals.
  !! Overloaded by generic procedure `head`.
  complex(r16), dimension(:), intent(in) :: x !! Input array
  head = x(1)
end function head_c16


pure character(len=1) function head_char(x) result(head)
  !! Returns the first element of array `x`.
  !! This specific procedure is for character strings.
  !! Overloaded by generic procedure `head`.
  character(len=*), intent(in) :: x !! Input array
  head = x(1:1)
end function head_char
