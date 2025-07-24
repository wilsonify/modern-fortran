!! Returns the last element of array `x`.
module mod_last
    use iso_fortran_env, only : i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
            r4 => real32, r8 => real64, r16 => real128

    implicit none
    private
    public :: last, operator(.last.)

    interface last
        module procedure last_i1, last_i2, last_i4, last_i8, &
                last_r4, last_r8, last_r16, &
                last_c4, last_c8, last_c16, last_char
    end interface

    interface operator(.last.)
        module procedure last_i1, last_i2, last_i4, last_i8, &
                last_r4, last_r8, last_r16, &
                last_c4, last_c8, last_c16, last_char
    end interface

contains
    pure integer(i1) function last_i1(x) result(last)
        !! Returns the last element of array `x`.
        !! This specific procedure is for 1-byte integers.
        !! Overloaded by generic procedure `last`.
        integer(i1), dimension(:), intent(in) :: x !! Input array
        last = x(size(x))
    end function last_i1


    pure integer(i2) function last_i2(x) result(last)
        !! Returns the last element of array `x`.
        !! This specific procedure is for 2-byte integers.
        !! Overloaded by generic procedure `last`.
        integer(i2), dimension(:), intent(in) :: x !! Input array
        last = x(size(x))
    end function last_i2


    pure integer(i4) function last_i4(x) result(last)
        !! Returns the last element of array `x`.
        !! This specific procedure is for 4-byte integers.
        !! Overloaded by generic procedure `last`.
        integer(i4), dimension(:), intent(in) :: x !! Input array
        last = x(size(x))
    end function last_i4


    pure integer(i8) function last_i8(x) result(last)
        !! Returns the last element of array `x`.
        !! This specific procedure is for 8-byte integers.
        !! Overloaded by generic procedure `last`.
        integer(i8), dimension(:), intent(in) :: x !! Input array
        last = x(size(x))
    end function last_i8


    pure real(r4) function last_r4(x) result(last)
        !! Returns the last element of array `x`.
        !! This specific procedure is for 4-byte reals.
        !! Overloaded by generic procedure `last`.
        real(r4), dimension(:), intent(in) :: x !! Input array
        last = x(size(x))
    end function last_r4


    pure real(r8) function last_r8(x) result(last)
        !! Returns the last element of array `x`.
        !! This specific procedure is for 8-byte reals.
        !! Overloaded by generic procedure `last`.
        real(r8), dimension(:), intent(in) :: x !! Input array
        last = x(size(x))
    end function last_r8


    pure real(r16) function last_r16(x) result(last)
        !! Returns the last element of array `x`.
        !! This specific procedure is for 16-byte reals.
        !! Overloaded by generic procedure `last`.
        real(r16), dimension(:), intent(in) :: x !! Input array
        last = x(size(x))
    end function last_r16


    pure complex(r4) function last_c4(x) result(last)
        !! Returns the last element of array `x`.
        !! This specific procedure is for 4-byte complex numbers.
        !! Overloaded by generic procedure `last`.
        complex(r4), dimension(:), intent(in) :: x !! Input array
        last = x(size(x))
    end function last_c4


    pure complex(r8) function last_c8(x) result(last)
        !! Returns the last element of array `x`.
        !! This specific procedure is for 8-byte complex numbers.
        !! Overloaded by generic procedure `last`.
        complex(r8), dimension(:), intent(in) :: x !! Input array
        last = x(size(x))
    end function last_c8


    pure complex(r16) function last_c16(x) result(last)
        !! Returns the last element of array `x`.
        !! This specific procedure is for 16-byte complex numbers.
        !! Overloaded by generic procedure `last`.
        complex(r16), dimension(:), intent(in) :: x !! Input array
        last = x(size(x))
    end function last_c16


    pure character(len = 1) function last_char(x) result(last)
        !! Returns the last element of array `x`.
        !! This specific procedure is for 16-byte complex numbers.
        !! Overloaded by generic procedure `last`.
        character(len = *), intent(in) :: x !! Input array
        last = x(len(x):len(x))
    end function last_char


end module mod_last
