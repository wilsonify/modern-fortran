
pure recursive integer(i1) function foldt_i1(f, start, x) result(res)
  !! Applies function `f` recursively along elements of array `x`
  !! using a tree-like fold,  splitting the array into two and repeating
  !! until we deplete the array.
  !! This specific procedure is for 1-byte integers.
  !! Overloaded by generic procedure `foldt`.
  procedure(f2_i1) :: f !! Folding function
  integer(i1), intent(in) :: start !! Accumulator start value
  integer(i1), dimension(:), intent(in) :: x !! Input array
  if(size(x) < 1)then
    res = start
  elseif(size(x) == 1)then
    res = f(start, x(1))
  else
    res = foldt(f, foldt(f, start, split(x, 1)), split(x, 2))
  endif
end function foldt_i1


pure recursive integer(i2) function foldt_i2(f, start, x) result(res)
  !! Applies function `f` recursively along elements of array `x`
  !! using a tree-like fold,  splitting the array into two and repeating
  !! until we deplete the array.
  !! This specific procedure is for 2-byte integers.
  !! Overloaded by generic procedure `foldt`.
  procedure(f2_i2) :: f !! Folding function
  integer(i2), intent(in) :: start !! Accumulator start value
  integer(i2), dimension(:), intent(in) :: x !! Input array
  if(size(x) < 1)then
    res = start
  elseif(size(x) == 1)then
    res = f(start, x(1))
  else
    res = foldt(f, foldt(f, start, split(x, 1)), split(x, 2))
  endif
end function foldt_i2


pure recursive integer(i4) function foldt_i4(f, start, x) result(res)
  !! Applies function `f` recursively along elements of array `x`
  !! using a tree-like fold,  splitting the array into two and repeating
  !! until we deplete the array.
  !! This specific procedure is for 4-byte integers.
  !! Overloaded by generic procedure `foldt`.
  procedure(f2_i4) :: f !! Folding function
  integer(i4), intent(in) :: start !! Accumulator start value
  integer(i4), dimension(:), intent(in) :: x !! Input array
  if(size(x) < 1)then
    res = start
  elseif(size(x) == 1)then
    res = f(start, x(1))
  else
    res = foldt(f, foldt(f, start, split(x, 1)), split(x, 2))
  endif
end function foldt_i4


pure recursive integer(i8) function foldt_i8(f, start, x) result(res)
  !! Applies function `f` recursively along elements of array `x`
  !! using a tree-like fold,  splitting the array into two and repeating
  !! until we deplete the array.
  !! This specific procedure is for 8-byte integers.
  !! Overloaded by generic procedure `foldt`.
  procedure(f2_i8) :: f !! Folding function
  integer(i8), intent(in) :: start !! Accumulator start value
  integer(i8), dimension(:), intent(in) :: x !! Input array
  if(size(x) < 1)then
    res = start
  elseif(size(x) == 1)then
    res = f(start, x(1))
  else
    res = foldt(f, foldt(f, start, split(x, 1)), split(x, 2))
  endif
end function foldt_i8


pure recursive real(r4) function foldt_r4(f, start, x) result(res)
  !! Applies function `f` recursively along elements of array `x`
  !! using a tree-like fold,  splitting the array into two and repeating
  !! until we deplete the array.
  !! This specific procedure is for 4-byte reals.
  !! Overloaded by generic procedure `foldt`.
  procedure(f2_r4) :: f !! Folding function
  real(r4), intent(in) :: start !! Accumulator start value
  real(r4), dimension(:), intent(in) :: x !! Input array
  if(size(x) < 1)then
    res = start
  elseif(size(x) == 1)then
    res = f(start, x(1))
  else
    res = foldt(f, foldt(f, start, split(x, 1)), split(x, 2))
  endif
end function foldt_r4


pure recursive real(r8) function foldt_r8(f, start, x) result(res)
  !! Applies function `f` recursively along elements of array `x`
  !! using a tree-like fold,  splitting the array into two and repeating
  !! until we deplete the array.
  !! This specific procedure is for 8-byte reals.
  !! Overloaded by generic procedure `foldt`.
  procedure(f2_r8) :: f !! Folding function
  real(r8), intent(in) :: start !! Accumulator start value
  real(r8), dimension(:), intent(in) :: x !! Input array
  if(size(x) < 1)then
    res = start
  elseif(size(x) == 1)then
    res = f(start, x(1))
  else
    res = foldt(f, foldt(f, start, split(x, 1)), split(x, 2))
  endif
end function foldt_r8


pure recursive real(r16) function foldt_r16(f, start, x) result(res)
  !! Applies function `f` recursively along elements of array `x`
  !! using a tree-like fold,  splitting the array into two and repeating
  !! until we deplete the array.
  !! This specific procedure is for 16-byte reals.
  !! Overloaded by generic procedure `foldt`.
  procedure(f2_r16) :: f !! Folding function
  real(r16), intent(in) :: start !! Accumulator start value
  real(r16), dimension(:), intent(in) :: x !! Input array
  if(size(x) < 1)then
    res = start
  elseif(size(x) == 1)then
    res = f(start, x(1))
  else
    res = foldt(f, foldt(f, start, split(x, 1)), split(x, 2))
  endif
end function foldt_r16


pure recursive complex(r4) function foldt_c4(f, start, x) result(res)
  !! Applies function `f` recursively along elements of array `x`
  !! using a tree-like fold,  splitting the array into two and repeating
  !! until we deplete the array.
  !! This specific procedure is for 4-byte complex reals.
  !! Overloaded by generic procedure `foldt`.
  procedure(f2_c4) :: f !! Folding function
  complex(r4), intent(in) :: start !! Accumulator start value
  complex(r4), dimension(:), intent(in) :: x !! Input array
  if(size(x) < 1)then
    res = start
  elseif(size(x) == 1)then
    res = f(start, x(1))
  else
    res = foldt(f, foldt(f, start, split(x, 1)), split(x, 2))
  endif
end function foldt_c4


pure recursive complex(r8) function foldt_c8(f, start, x) result(res)
  !! Applies function `f` recursively along elements of array `x`
  !! using a tree-like fold,  splitting the array into two and repeating
  !! until we deplete the array.
  !! This specific procedure is for 8-byte complex reals.
  !! Overloaded by generic procedure `foldt`.
  procedure(f2_c8) :: f !! Folding function
  complex(r8), intent(in) :: start !! Accumulator start value
  complex(r8), dimension(:), intent(in) :: x !! Input array
  if(size(x) < 1)then
    res = start
  elseif(size(x) == 1)then
    res = f(start, x(1))
  else
    res = foldt(f, foldt(f, start, split(x, 1)), split(x, 2))
  endif
end function foldt_c8


pure recursive complex(r16) function foldt_c16(f, start, x) result(res)
  !! Applies function `f` recursively along elements of array `x`
  !! using a tree-like fold,  splitting the array into two and repeating
  !! until we deplete the array.
  !! This specific procedure is for 16-byte complex reals.
  !! Overloaded by generic procedure `foldt`.
  procedure(f2_c16) :: f !! Folding function
  complex(r16), intent(in) :: start !! Accumulator start value
  complex(r16), dimension(:), intent(in) :: x !! Input array
  if(size(x) < 1)then
    res = start
  elseif(size(x) == 1)then
    res = f(start, x(1))
  else
    res = foldt(f, foldt(f, start, split(x, 1)), split(x, 2))
  endif
end function foldt_c16

