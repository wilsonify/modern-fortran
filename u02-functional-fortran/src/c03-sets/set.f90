pure recursive function set_i1(x) result(res)
  !! Returns a set given array `x`.
  !! This specific procedure is for 1-byte integers.
  !! Overloaded by generic procedure `set`.
  integer(i1), dimension(:), intent(in) :: x !! Input array
  integer(i1), dimension(:), allocatable :: res
  if(size(x) > 1)then
    res = [x(1), set(pack(x(2:), .not. x(2:) == x(1)))]
  else
    res = x
  endif
end function set_i1


pure recursive function set_i2(x) result(res)
  !! Returns a set given array `x`.
  !! This specific procedure is for 2-byte integers.
  !! Overloaded by generic procedure `set`.
  integer(i2), dimension(:), intent(in) :: x !! Input array
  integer(i2), dimension(:), allocatable :: res
  if(size(x) > 1)then
    res = [x(1), set(pack(x(2:), .not. x(2:) == x(1)))]
  else
    res = x
  endif
end function set_i2

pure recursive function set_i4(x) result(res)
  !! Returns a set given array `x`.
  !! This specific procedure is for 4-byte integers.
  !! Overloaded by generic procedure `set`.
  integer(i4), dimension(:), intent(in) :: x !! Input array
  integer(i4), dimension(:), allocatable :: res
  if(size(x) > 1)then
    res = [x(1), set(pack(x(2:), .not. x(2:) == x(1)))]
  else
    res = x
  endif
end function set_i4


pure recursive function set_i8(x) result(res)
  !! Returns a set given array `x`.
  !! This specific procedure is for 8-byte integers.
  !! Overloaded by generic procedure `set`.
  integer(i8), dimension(:), intent(in) :: x !! Input array
  integer(i8), dimension(:), allocatable :: res
  if(size(x) > 1)then
    res = [x(1), set(pack(x(2:), .not. x(2:) == x(1)))]
  else
    res = x
  endif
end function set_i8


pure recursive function set_r4(x) result(res)
  !! Returns a set given array `x`.
  !! This specific procedure is for 4-byte reals.
  !! Overloaded by generic procedure `set`.
  real(r4), dimension(:), intent(in) :: x !! Input array
  real(r4), dimension(:), allocatable :: res
  if(size(x) > 1)then
    res = [x(1), set(pack(x(2:), .not. x(2:) == x(1)))]
  else
    res = x
  endif
end function set_r4


pure recursive function set_r8(x) result(res)
  !! Returns a set given array `x`.
  !! This specific procedure is for 8-byte reals.
  !! Overloaded by generic procedure `set`.
  real(r8), dimension(:), intent(in) :: x !! Input array
  real(r8), dimension(:), allocatable :: res
  if(size(x) > 1)then
    res = [x(1), set(pack(x(2:), .not. x(2:) == x(1)))]
  else
    res = x
  endif
end function set_r8


pure recursive function set_r16(x) result(res)
  !! Returns a set given array `x`.
  !! This specific procedure is for 16-byte reals.
  !! Overloaded by generic procedure `set`.
  real(r16), dimension(:), intent(in) :: x !! Input array
  real(r16), dimension(:), allocatable :: res
  if(size(x) > 1)then
    res = [x(1), set(pack(x(2:), .not. x(2:) == x(1)))]
  else
    res = x
  endif
end function set_r16


pure recursive function set_c4(x) result(res)
  !! Returns a set given array `x`.
  !! This specific procedure is for 4-byte complex reals.
  !! Overloaded by generic procedure `set`.
  complex(r4), dimension(:), intent(in) :: x !! Input array
  complex(r4), dimension(:), allocatable :: res
  if(size(x) > 1)then
    res = [x(1), set(pack(x(2:), .not. x(2:) == x(1)))]
  else
    res = x
  endif
end function set_c4


pure recursive function set_c8(x) result(res)
  !! Returns a set given array `x`.
  !! This specific procedure is for 8-byte complex reals.
  !! Overloaded by generic procedure `set`.
  complex(r8), dimension(:), intent(in) :: x !! Input array
  complex(r8), dimension(:), allocatable :: res
  if(size(x) > 1)then
    res = [x(1), set(pack(x(2:), .not. x(2:) == x(1)))]
  else
    res = x
  endif
end function set_c8


pure recursive function set_c16(x) result(res)
  !! Returns a set given array `x`.
  !! This specific procedure is for 16-byte complex reals.
  !! Overloaded by generic procedure `set`.
  complex(r16), dimension(:), intent(in) :: x !! Input array
  complex(r16), dimension(:), allocatable :: res
  if(size(x) > 1)then
    res = [x(1), set(pack(x(2:), .not. x(2:) == x(1)))]
  else
    res = x
  endif
end function set_c16


pure recursive function set_char(x) result(res)
  !! Returns a set given character string `x`.
  !! Overloaded by generic procedure `set`.
  character(len=*), intent(in) :: x !! Input character string
  character(len=:), allocatable :: res
  res = arrstr(achar(set(iachar(strarr(x)))))
end function set_char
