!! Returns all elements of `x` but the first.
module mod_tail
    use iso_fortran_env, only : i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
            r4 => real32, r8 => real64, r16 => real128

    interface tail
        module procedure tail_i1, tail_i2, tail_i4, tail_i8, &
                tail_r4, tail_r8, tail_r16, &
                tail_c4, tail_c8, tail_c16, &
                tail_char
    end interface tail

    interface operator(.tail.)
        module procedure tail_i1, tail_i2, tail_i4, tail_i8, &
                tail_r4, tail_r8, tail_r16, &
                tail_c4, tail_c8, tail_c16, &
                tail_char
    end interface

contains

    pure function tail_i1(x) result(tail)
        !! Returns all elements of `x` but the first.
        !! This specific procedure is for 1-byte integers.
        !! Overloaded by generic procedure `tail`.
        integer(i1), dimension(:), intent(in) :: x !! Input array
        integer(i1), dimension(size(x) - 1) :: tail
        tail = x(2:)
    end function tail_i1


    pure function tail_i2(x) result(tail)
        !! Returns all elements of `x` but the first.
        !! This specific procedure is for 2-byte integers.
        !! Overloaded by generic procedure `tail`.
        integer(i2), dimension(:), intent(in) :: x !! Input array
        integer(i2), dimension(size(x) - 1) :: tail
        tail = x(2:)
    end function tail_i2


    pure function tail_i4(x) result(tail)
        !! Returns all elements of `x` but the first.
        !! This specific procedure is for 4-byte integers.
        !! Overloaded by generic procedure `tail`.
        integer(i4), dimension(:), intent(in) :: x !! Input array
        integer(i4), dimension(size(x) - 1) :: tail
        tail = x(2:)
    end function tail_i4


    pure function tail_i8(x) result(tail)
        !! Returns all elements of `x` but the first.
        !! This specific procedure is for 8-byte integers.
        !! Overloaded by generic procedure `tail`.
        integer(i8), dimension(:), intent(in) :: x !! Input array
        integer(i8), dimension(size(x) - 1) :: tail
        tail = x(2:)
    end function tail_i8


    pure function tail_r4(x) result(tail)
        !! Returns all elements of `x` but the first.
        !! This specific procedure is for 4-byte reals.
        !! Overloaded by generic procedure `tail`.
        real(r4), dimension(:), intent(in) :: x !! Input array
        real(r4), dimension(size(x) - 1) :: tail
        tail = x(2:)
    end function tail_r4


    pure function tail_r8(x) result(tail)
        !! Returns all elements of `x` but the first.
        !! This specific procedure is for 8-byte reals.
        !! Overloaded by generic procedure `tail`.
        real(r8), dimension(:), intent(in) :: x !! Input array
        real(r8), dimension(size(x) - 1) :: tail
        tail = x(2:)
    end function tail_r8


    pure function tail_r16(x) result(tail)
        !! Returns all elements of `x` but the first.
        !! This specific procedure is for 16-byte reals.
        !! Overloaded by generic procedure `tail`.
        real(r16), dimension(:), intent(in) :: x !! Input array
        real(r16), dimension(size(x) - 1) :: tail
        tail = x(2:)
    end function tail_r16


    pure function tail_c4(x) result(tail)
        !! Returns all elements of `x` but the first.
        !! This specific procedure is for 4-byte complex numbers.
        !! Overloaded by generic procedure `tail`.
        complex(r4), dimension(:), intent(in) :: x !! Input array
        complex(r4), dimension(size(x) - 1) :: tail
        tail = x(2:)
    end function tail_c4


    pure function tail_c8(x) result(tail)
        !! Returns all elements of `x` but the first.
        !! This specific procedure is for 8-byte complex numbers.
        !! Overloaded by generic procedure `tail`.
        complex(r8), dimension(:), intent(in) :: x !! Input array
        complex(r8), dimension(size(x) - 1) :: tail
        tail = x(2:)
    end function tail_c8


    pure function tail_c16(x) result(tail)
        !! Returns all elements of `x` but the first.
        !! This specific procedure is for 16-byte complex numbers.
        !! Overloaded by generic procedure `tail`.
        complex(r16), dimension(:), intent(in) :: x !! Input array
        complex(r16), dimension(size(x) - 1) :: tail
        tail = x(2:)
    end function tail_c16


    pure function tail_char(x) result(tail)
        !! Returns all elements of `x` but the first.
        !! This specific procedure is for character strings.
        !! Overloaded by generic procedure `tail`.
        character(len = *), intent(in) :: x !! Input array
        character(len = len(x) - 1) :: tail
        tail = x(2:)
    end function tail_char
end module mod_tail