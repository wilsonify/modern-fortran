pure function complement_i1(x, y) result(complement)
  !! Returns a set complement of two arrays.
  !! This specific procedure is for 1-byte integers.
  !! Overloaded by generic procedure `complement`.
  integer(i1), dimension(:), intent(in) :: x !! First input array
  integer(i1), dimension(:), intent(in) :: y !! Second input array
  integer(i1), dimension(:), allocatable :: complement
  integer(i1), dimension(:), allocatable :: a, b
  integer(i4) :: n
  a = set(x)
  b = set(y)
  complement = arange(1_i1, 0_i1)
  do concurrent (n = 1:size(a))
    if(.not. any(b == a(n)))complement = [complement, a(n)]
  enddo
end function complement_i1


pure function complement_i2(x, y) result(complement)
  !! Returns a set complement of two arrays.
  !! This specific procedure is for 2-byte integers.
  !! Overloaded by generic procedure `complement`.
  integer(i2), dimension(:), intent(in) :: x !! First input array
  integer(i2), dimension(:), intent(in) :: y !! Second input array
  integer(i2), dimension(:), allocatable :: complement
  integer(i2), dimension(:), allocatable :: a, b
  integer(i4) :: n
  a = set(x)
  b = set(y)
  complement = arange(1_i2, 0_i2)
  do concurrent (n = 1:size(a))
    if(.not. any(b == a(n)))complement = [complement, a(n)]
  enddo
end function complement_i2


pure function complement_i4(x, y) result(complement)
  !! Returns a set complement of two arrays.
  !! This specific procedure is for 4-byte integers.
  !! Overloaded by generic procedure `complement`.
  integer(i4), dimension(:), intent(in) :: x !! First input array
  integer(i4), dimension(:), intent(in) :: y !! Second input array
  integer(i4), dimension(:), allocatable :: complement
  integer(i4), dimension(:), allocatable :: a, b
  integer(i4) :: n
  a = set(x)
  b = set(y)
  complement = arange(1_i4, 0_i4)
  do concurrent (n = 1:size(a))
    if(.not. any(b == a(n)))complement = [complement, a(n)]
  enddo
end function complement_i4


pure function complement_i8(x, y) result(complement)
  !! Returns a set complement of two arrays.
  !! This specific procedure is for 4-byte integers.
  !! Overloaded by generic procedure `complement`.
  integer(i8), dimension(:), intent(in) :: x !! First input array
  integer(i8), dimension(:), intent(in) :: y !! Second input array
  integer(i8), dimension(:), allocatable :: complement
  integer(i8), dimension(:), allocatable :: a, b
  integer(i4) :: n
  a = set(x)
  b = set(y)
  complement = arange(1_i8, 0_i8)
  do concurrent (n = 1:size(a))
    if(.not. any(b == a(n)))complement = [complement, a(n)]
  enddo
end function complement_i8


pure function complement_r4(x, y) result(complement)
  !! Returns a set complement of two arrays.
  !! This specific procedure is for 4-byte reals.
  !! Overloaded by generic procedure `complement`.
  real(r4), dimension(:), intent(in) :: x !! First input array
  real(r4), dimension(:), intent(in) :: y !! Second input array
  real(r4), dimension(:), allocatable :: complement
  real(r4), dimension(:), allocatable :: a, b
  integer(i4) :: n
  a = set(x)
  b = set(y)
  complement = arange(1._r4, 0._r4)
  do concurrent (n = 1:size(a))
    if(.not. any(b == a(n)))complement = [complement, a(n)]
  enddo
end function complement_r4


pure function complement_r8(x, y) result(complement)
  !! Returns a set complement of two arrays.
  !! This specific procedure is for 8-byte reals.
  !! Overloaded by generic procedure `complement`.
  real(r8), dimension(:), intent(in) :: x !! First input array
  real(r8), dimension(:), intent(in) :: y !! Second input array
  real(r8), dimension(:), allocatable :: complement
  real(r8), dimension(:), allocatable :: a, b
  integer(i4) :: n
  a = set(x)
  b = set(y)
  complement = arange(1._r4, 0._r4)
  do concurrent (n = 1:size(a))
    if(.not. any(b == a(n)))complement = [complement, a(n)]
  enddo
end function complement_r8


pure function complement_r16(x, y) result(complement)
  !! Returns a set complement of two arrays.
  !! This specific procedure is for 16-byte reals.
  !! Overloaded by generic procedure `complement`.
  real(r16), dimension(:), intent(in) :: x !! First input array
  real(r16), dimension(:), intent(in) :: y !! Second input array
  real(r16), dimension(:), allocatable :: complement
  real(r16), dimension(:), allocatable :: a, b
  integer(i4) :: n
  a = set(x)
  b = set(y)
  complement = arange(1._r16, 0._r16)
  do concurrent (n = 1:size(a))
    if(.not. any(b == a(n)))complement = [complement, a(n)]
  enddo
end function complement_r16


pure function complement_c4(x, y) result(complement)
  !! Returns a set complement of two arrays.
  !! This specific procedure is for 4-byte complex reals.
  !! Overloaded by generic procedure `complement`.
  complex(r4), dimension(:), intent(in) :: x !! First input array
  complex(r4), dimension(:), intent(in) :: y !! Second input array
  complex(r4), dimension(:), allocatable :: complement
  complex(r4), dimension(:), allocatable :: a, b
  integer(i4) :: n
  a = set(x)
  b = set(y)
  complement = arange(cmplx(1._r4, 0._r4), cmplx(0._r4, 0._r4))
  do concurrent (n = 1:size(a))
    if(.not. any(b == a(n)))complement = [complement, a(n)]
  enddo
end function complement_c4


pure function complement_c8(x, y) result(complement)
  !! Returns a set complement of two arrays.
  !! This specific procedure is for 8-byte complex reals.
  !! Overloaded by generic procedure `complement`.
  complex(r8), dimension(:), intent(in) :: x !! First input array
  complex(r8), dimension(:), intent(in) :: y !! Second input array
  complex(r8), dimension(:), allocatable :: complement
  complex(r8), dimension(:), allocatable :: a, b
  integer(i4) :: n
  a = set(x)
  b = set(y)
  complement = arange(cmplx(1._r4, 0._r4), cmplx(0._r4, 0._r4))
  do concurrent (n = 1:size(a))
    if(.not. any(b == a(n)))complement = [complement, a(n)]
  enddo
end function complement_c8


pure function complement_c16(x, y) result(complement)
  !! Returns a set complement of two arrays.
  !! This specific procedure is for 16-byte complex reals.
  !! Overloaded by generic procedure `complement`.
  complex(r16), dimension(:), intent(in) :: x !! First input array
  complex(r16), dimension(:), intent(in) :: y !! Second input array
  complex(r16), dimension(:), allocatable :: complement
  complex(r16), dimension(:), allocatable :: a, b
  integer(i4) :: n
  a = set(x)
  b = set(y)
  complement = arange(cmplx(1._r16, 0._r16), cmplx(0._r16, 0._r16))
  do concurrent (n = 1:size(a))
    if(.not. any(b == a(n)))complement = [complement, a(n)]
  enddo
end function complement_c16


pure function complement_char(x, y) result(complement)
  !! Returns a set complement of two character strings.
  !! Overloaded by generic procedure `complement`.
  character(len=*), intent(in) :: x !! First input array
  character(len=*), intent(in) :: y !! Second input array
  character(len=:), allocatable :: complement
  character(len=:), allocatable :: a, b
  integer(i4) :: n
  a = set(x)
  b = set(y)
  complement = ''
  do concurrent (n = 1:len(a))
    if (scan(a(n:n), b) == 0) complement = complement // a(n:n)
  enddo
end function complement_char

