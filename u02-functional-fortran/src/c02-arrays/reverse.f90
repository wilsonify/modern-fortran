module mod_reverse
contains

    pure function reverse_i1(x) result(reverse)
        !! Returns the array `x` in reverse order.
        !! This specific procedure is for 1-byte integers.
        !! Overloaded by generic procedure `reverse`.
        integer(i1), dimension(:), intent(in) :: x !! Input array
        integer(i1), dimension(size(x)) :: reverse
        reverse = x(size(x):1:-1)
    end function reverse_i1


    pure function reverse_i2(x) result(reverse)
        !! Returns the array `x` in reverse order.
        !! This specific procedure is for 2-byte integers.
        !! Overloaded by generic procedure `reverse`.
        integer(i2), dimension(:), intent(in) :: x !! Input array
        integer(i2), dimension(size(x)) :: reverse
        reverse = x(size(x):1:-1)
    end function reverse_i2


    pure function reverse_i4(x) result(reverse)
        !! Returns the array `x` in reverse order.
        !! This specific procedure is for 4-byte integers.
        !! Overloaded by generic procedure `reverse`.
        integer(i4), dimension(:), intent(in) :: x !! Input array
        integer(i4), dimension(size(x)) :: reverse
        reverse = x(size(x):1:-1)
    end function reverse_i4


    pure function reverse_i8(x) result(reverse)
        !! Returns the array `x` in reverse order.
        !! This specific procedure is for 8-byte integers.
        !! Overloaded by generic procedure `reverse`.
        integer(i8), dimension(:), intent(in) :: x !! Input array
        integer(i8), dimension(size(x)) :: reverse
        reverse = x(size(x):1:-1)
    end function reverse_i8


    pure function reverse_r4(x) result(reverse)
        !! Returns the array `x` in reverse order.
        !! This specific procedure is for 4-byte reals.
        !! Overloaded by generic procedure `reverse`.
        real(r4), dimension(:), intent(in) :: x !! Input array
        real(r4), dimension(size(x)) :: reverse
        reverse = x(size(x):1:-1)
    end function reverse_r4


    pure function reverse_r8(x) result(reverse)
        !! Returns the array `x` in reverse order.
        !! This specific procedure is for 8-byte reals.
        !! Overloaded by generic procedure `reverse`.
        real(r8), dimension(:), intent(in) :: x !! Input array
        real(r8), dimension(size(x)) :: reverse
        reverse = x(size(x):1:-1)
    end function reverse_r8


    pure function reverse_r16(x) result(reverse)
        !! Returns the array `x` in reverse order.
        !! This specific procedure is for 16-byte reals.
        !! Overloaded by generic procedure `reverse`.
        real(r16), dimension(:), intent(in) :: x !! Input array
        real(r16), dimension(size(x)) :: reverse
        reverse = x(size(x):1:-1)
    end function reverse_r16


    pure function reverse_c4(x) result(reverse)
        !! Returns the array `x` in reverse order.
        !! This specific procedure is for 4-byte complex reals.
        !! Overloaded by generic procedure `reverse`.
        complex(r4), dimension(:), intent(in) :: x !! Input array
        complex(r4), dimension(size(x)) :: reverse
        reverse = x(size(x):1:-1)
    end function reverse_c4


    pure function reverse_c8(x) result(reverse)
        !! Returns the array `x` in reverse order.
        !! This specific procedure is for 8-byte complex reals.
        !! Overloaded by generic procedure `reverse`.
        complex(r8), dimension(:), intent(in) :: x !! Input array
        complex(r8), dimension(size(x)) :: reverse
        reverse = x(size(x):1:-1)
    end function reverse_c8


    pure function reverse_c16(x) result(reverse)
        !! Returns the array `x` in reverse order.
        !! This specific procedure is for 16-byte complex reals.
        !! Overloaded by generic procedure `reverse`.
        complex(r16), dimension(:), intent(in) :: x !! Input array
        complex(r16), dimension(size(x)) :: reverse
        reverse = x(size(x):1:-1)
    end function reverse_c16


    pure function reverse_char(x) result(res)
        !! Returns the character string `x` in reverse order.
        !! Overloaded by generic procedure `reverse`.
        character(len = *), intent(in) :: x !! Input array
        character(len = len(x)) :: res
        res = arrstr(achar(reverse(iachar(strarr(x)))))
    end function reverse_char

end module mod_reverse