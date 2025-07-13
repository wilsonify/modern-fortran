pure elemental integer(i1) function limit_i1(x, a, b) result(limit)
  !! Returns `x` if `min(a, b) <= x .and. x <= max(a, b)`,
  !! `min(a, b) if `x < min(a, b)` and `max(a, b) if `x < max(a, b)`.
  !! This specific procedure is for 1-byte integers.
  !! Overloaded by generic procedure `limit`.
  integer(i1), intent(in) :: x !! Input scalar
  integer(i1), intent(in) :: a !! First limit
  integer(i1), intent(in) :: b !! Second limit
  limit = min(max(x, min(a, b)), max(a, b))
end function limit_i1


pure elemental integer(i2) function limit_i2(x, a, b) result(limit)
  !! Returns `x` if `min(a, b) <= x .and. x <= max(a, b)`,
  !! `min(a, b) if `x < min(a, b)` and `max(a, b) if `x < max(a, b)`.
  !! This specific procedure is for 2-byte integers.
  !! Overloaded by generic procedure `limit`.
  integer(i2), intent(in) :: x !! Input scalar
  integer(i2), intent(in) :: a !! First limit
  integer(i2), intent(in) :: b !! Second limit
  limit = min(max(x, min(a, b)), max(a, b))
end function limit_i2


pure elemental integer(i4) function limit_i4(x, a, b) result(limit)
  !! Returns `x` if `min(a, b) <= x .and. x <= max(a, b)`,
  !! `min(a, b) if `x < min(a, b)` and `max(a, b) if `x < max(a, b)`.
  !! This specific procedure is for 4-byte integers.
  !! Overloaded by generic procedure `limit`.
  integer(i4), intent(in) :: x !! Input scalar
  integer(i4), intent(in) :: a !! First limit
  integer(i4), intent(in) :: b !! Second limit
  limit = min(max(x, min(a, b)), max(a, b))
end function limit_i4


pure elemental integer(i8) function limit_i8(x, a, b) result(limit)
  !! Returns `x` if `min(a, b) <= x .and. x <= max(a, b)`,
  !! `min(a, b) if `x < min(a, b)` and `max(a, b) if `x < max(a, b)`.
  !! This specific procedure is for 1-byte integers.
  !! Overloaded by generic procedure `limit`.
  integer(i8), intent(in) :: x !! Input scalar
  integer(i8), intent(in) :: a !! First limit
  integer(i8), intent(in) :: b !! Second limit
  limit = min(max(x, min(a, b)), max(a, b))
end function limit_i8


pure elemental real(r4) function limit_r4(x, a, b) result(limit)
  !! Returns `x` if `min(a, b) <= x .and. x <= max(a, b)`,
  !! `min(a, b) if `x < min(a, b)` and `max(a, b) if `x < max(a, b)`.
  !! This specific procedure is for 4-byte reals.
  !! Overloaded by generic procedure `limit`.
  real(r4), intent(in) :: x !! Input scalar
  real(r4), intent(in) :: a !! First limit
  real(r4), intent(in) :: b !! Second limit
  limit = min(max(x, min(a, b)), max(a, b))
end function limit_r4


pure elemental real(r8) function limit_r8(x, a, b) result(limit)
  !! Returns `x` if `min(a, b) <= x .and. x <= max(a, b)`,
  !! `min(a, b) if `x < min(a, b)` and `max(a, b) if `x < max(a, b)`.
  !! This specific procedure is for 8-byte reals.
  !! Overloaded by generic procedure `limit`.
  real(r8), intent(in) :: x !! Input scalar
  real(r8), intent(in) :: a !! First limit
  real(r8), intent(in) :: b !! Second limit
  limit = min(max(x, min(a, b)), max(a, b))
end function limit_r8


pure elemental real(r16) function limit_r16(x, a, b) result(limit)
  !! Returns `x` if `min(a, b) <= x .and. x <= max(a, b)`,
  !! `min(a, b) if `x < min(a, b)` and `max(a, b) if `x < max(a, b)`.
  !! This specific procedure is for 16-byte reals.
  !! Overloaded by generic procedure `limit`.
  real(r16), intent(in) :: x !! Input scalar
  real(r16), intent(in) :: a !! First limit
  real(r16), intent(in) :: b !! Second limit
  limit = min(max(x, min(a, b)), max(a, b))
end function limit_r16


pure elemental complex(r4) function limit_c4(x, a, b) result(limit)
  !! Returns `x` if `min(a, b) <= x .and. x <= max(a, b)`,
  !! `min(a, b) if `x < min(a, b)` and `max(a, b) if `x < max(a, b)`,
  !! for Re and Im components each.
  !! This specific procedure is for 4-byte complex reals.
  !! Overloaded by generic procedure `limit`.
  complex(r4), intent(in) :: x !! Input scalar
  complex(r4), intent(in) :: a !! First limit
  complex(r4), intent(in) :: b !! Second limit
  limit = cmplx(min(max(real(x), min(real(a), real(b))), max(real(a), real(b))), &
    min(max(aimag(x), min(aimag(a), aimag(b))), max(aimag(a), aimag(b))))
end function limit_c4


pure elemental complex(r8) function limit_c8(x, a, b) result(limit)
  !! Returns `x` if `min(a, b) <= x .and. x <= max(a, b)`,
  !! `min(a, b) if `x < min(a, b)` and `max(a, b) if `x < max(a, b)`,
  !! for Re and Im components each.
  !! This specific procedure is for 8-byte complex reals.
  !! Overloaded by generic procedure `limit`.
  complex(r8), intent(in) :: x !! Input scalar
  complex(r8), intent(in) :: a !! First limit
  complex(r8), intent(in) :: b !! Second limit
  limit = cmplx(min(max(real(x), min(real(a), real(b))), max(real(a), real(b))), &
    min(max(aimag(x), min(aimag(a), aimag(b))), max(aimag(a), aimag(b))))
end function limit_c8


pure elemental complex(r16) function limit_c16(x, a, b) result(limit)
  !! Returns `x` if `min(a, b) <= x .and. x <= max(a, b)`,
  !! `min(a, b) if `x < min(a, b)` and `max(a, b) if `x < max(a, b)`,
  !! for Re and Im components each.
  !! This specific procedure is for 16-byte complex reals.
  !! Overloaded by generic procedure `limit`.
  complex(r16), intent(in) :: x !! Input scalar
  complex(r16), intent(in) :: a !! First limit
  complex(r16), intent(in) :: b !! Second limit
  limit = cmplx(min(max(real(x), min(real(a), real(b))), max(real(a), real(b))), &
    min(max(aimag(x), min(aimag(a), aimag(b))), max(aimag(a), aimag(b))))
end function limit_c16
