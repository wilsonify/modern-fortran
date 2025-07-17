module mod_foldl
contains

    pure recursive integer(i1) function foldl_i1(f, start, x) result(res)
        !! Applies function `f` recursively along elements of array `x`.
        !! Equivalent to haskell's left fold. If the array is empty,  the
        !! result is `start`; else we recurse immediately,  making the new
        !! initial value the result of combining the old initial value
        !! with the first element of `x`.
        !! This specific procedure is for 1-byte integers.
        !! Overloaded by generic procedure `foldl`.
        procedure(f2_i1) :: f !! Folding function
        integer(i1), intent(in) :: start !! Accumulator start value
        integer(i1), dimension(:), intent(in) :: x !! Input array
        if(size(x) < 1)then
            res = start
        else
            res = foldl(f, f(start, x(1)), x(2:))
        endif
    end function foldl_i1


    pure recursive integer(i2) function foldl_i2(f, start, x) result(res)
        !! Applies function `f` recursively along elements of array `x`.
        !! Equivalent to haskell's left fold. If the array is empty,  the
        !! result is `start`; else we recurse immediately,  making the new
        !! initial value the result of combining the old initial value
        !! with the first element of `x`.
        !! This specific procedure is for 2-byte integers.
        !! Overloaded by generic procedure `foldl`.
        procedure(f2_i2) :: f !! Folding function
        integer(i2), intent(in) :: start !! Accumulator start value
        integer(i2), dimension(:), intent(in) :: x !! Input array
        if(size(x) < 1)then
            res = start
        else
            res = foldl(f, f(start, x(1)), x(2:))
        endif
    end function foldl_i2


    pure recursive integer(i4) function foldl_i4(f, start, x) result(res)
        !! Applies function `f` recursively along elements of array `x`.
        !! Equivalent to haskell's left fold. If the array is empty,  the
        !! result is `start`; else we recurse immediately,  making the new
        !! initial value the result of combining the old initial value
        !! with the first element of `x`.
        !! This specific procedure is for 4-byte integers.
        !! Overloaded by generic procedure `foldl`.
        procedure(f2_i4) :: f !! Folding function
        integer(i4), intent(in) :: start !! Accumulator start value
        integer(i4), dimension(:), intent(in) :: x !! Input array
        if(size(x) < 1)then
            res = start
        else
            res = foldl(f, f(start, x(1)), x(2:))
        endif
    end function foldl_i4


    pure recursive integer(i8) function foldl_i8(f, start, x) result(res)
        !! Applies function `f` recursively along elements of array `x`.
        !! Equivalent to haskell's left fold. If the array is empty,  the
        !! result is `start`; else we recurse immediately,  making the new
        !! initial value the result of combining the old initial value
        !! with the first element of `x`.
        !! This specific procedure is for 8-byte integers.
        !! Overloaded by generic procedure `foldl`.
        procedure(f2_i8) :: f !! Folding function
        integer(i8), intent(in) :: start !! Accumulator start value
        integer(i8), dimension(:), intent(in) :: x !! Input array
        if(size(x) < 1)then
            res = start
        else
            res = foldl(f, f(start, x(1)), x(2:))
        endif
    end function foldl_i8


    pure recursive real(r4) function foldl_r4(f, start, x) result(res)
        !! Applies function `f` recursively along elements of array `x`.
        !! Equivalent to haskell's left fold. If the array is empty,  the
        !! result is `start`; else we recurse immediately,  making the new
        !! initial value the result of combining the old initial value
        !! with the first element of `x`.
        !! This specific procedure is for 4-byte reals.
        !! Overloaded by generic procedure `foldl`.
        procedure(f2_r4) :: f !! Folding function
        real(r4), intent(in) :: start !! Accumulator start value
        real(r4), dimension(:), intent(in) :: x !! Input array
        if(size(x) < 1)then
            res = start
        else
            res = foldl(f, f(start, x(1)), x(2:))
        endif
    end function foldl_r4


    pure recursive real(r8) function foldl_r8(f, start, x) result(res)
        !! Applies function `f` recursively along elements of array `x`.
        !! Equivalent to haskell's left fold. If the array is empty,  the
        !! result is `start`; else we recurse immediately,  making the new
        !! initial value the result of combining the old initial value
        !! with the first element of `x`.
        !! This specific procedure is for 8-byte reals.
        !! Overloaded by generic procedure `foldl`.
        procedure(f2_r8) :: f !! Folding function
        real(r8), intent(in) :: start !! Accumulator start value
        real(r8), dimension(:), intent(in) :: x !! Input array
        if(size(x) < 1)then
            res = start
        else
            res = foldl(f, f(start, x(1)), x(2:))
        endif
    end function foldl_r8


    pure recursive real(r16) function foldl_r16(f, start, x) result(res)
        !! Applies function `f` recursively along elements of array `x`.
        !! Equivalent to haskell's left fold. If the array is empty,  the
        !! result is `start`; else we recurse immediately,  making the new
        !! initial value the result of combining the old initial value
        !! with the first element of `x`.
        !! This specific procedure is for 8-byte reals.
        !! Overloaded by generic procedure `foldl`.
        procedure(f2_r16) :: f !! Folding function
        real(r16), intent(in) :: start !! Accumulator start value
        real(r16), dimension(:), intent(in) :: x !! Input array
        if(size(x) < 1)then
            res = start
        else
            res = foldl(f, f(start, x(1)), x(2:))
        endif
    end function foldl_r16


    pure recursive complex(r4) function foldl_c4(f, start, x) result(res)
        !! Applies function `f` recursively along elements of array `x`.
        !! Equivalent to haskell's left fold. If the array is empty,  the
        !! result is `start`; else we recurse immediately,  making the new
        !! initial value the result of combining the old initial value
        !! with the first element of `x`.
        !! This specific procedure is for 4-byte complex reals.
        !! Overloaded by generic procedure `foldl`.
        procedure(f2_c4) :: f !! Folding function
        complex(r4), intent(in) :: start !! Accumulator start value
        complex(r4), dimension(:), intent(in) :: x !! Input array
        if(size(x) < 1)then
            res = start
        else
            res = foldl(f, f(start, x(1)), x(2:))
        endif
    end function foldl_c4


    pure recursive complex(r8) function foldl_c8(f, start, x) result(res)
        !! Applies function `f` recursively along elements of array `x`.
        !! Equivalent to haskell's left fold. If the array is empty,  the
        !! result is `start`; else we recurse immediately,  making the new
        !! initial value the result of combining the old initial value
        !! with the first element of `x`.
        !! This specific procedure is for 8-byte complex reals.
        !! Overloaded by generic procedure `foldl`.
        procedure(f2_c8) :: f !! Folding function
        complex(r8), intent(in) :: start !! Accumulator start value
        complex(r8), dimension(:), intent(in) :: x !! Input array
        if(size(x) < 1)then
            res = start
        else
            res = foldl(f, f(start, x(1)), x(2:))
        endif
    end function foldl_c8


    pure recursive complex(r16) function foldl_c16(f, start, x) result(res)
        !! Applies function `f` recursively along elements of array `x`.
        !! Equivalent to haskell's left fold. If the array is empty,  the
        !! result is `start`; else we recurse immediately,  making the new
        !! initial value the result of combining the old initial value
        !! with the first element of `x`.
        !! This specific procedure is for 8-byte complex reals.
        !! Overloaded by generic procedure `foldl`.
        procedure(f2_c16) :: f !! Folding function
        complex(r16), intent(in) :: start !! Accumulator start value
        complex(r16), dimension(:), intent(in) :: x !! Input array
        if(size(x) < 1)then
            res = start
        else
            res = foldl(f, f(start, x(1)), x(2:))
        endif
    end function foldl_c16
end module mod_foldl