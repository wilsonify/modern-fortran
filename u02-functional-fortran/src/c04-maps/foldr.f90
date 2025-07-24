module mod_foldr
    use iso_fortran_env, only : i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
            r4 => real32, r8 => real64, r16 => real128
    implicit none
    private
    public :: foldr

    interface foldr
        module procedure foldr_i1, foldr_i2, foldr_i4, foldr_i8, &
                foldr_r4, foldr_r8, foldr_r16, &
                foldr_c4, foldr_c8, foldr_c16
    end interface foldr

    !--- Abstract interface for binary function arguments ---
    abstract interface
        pure function f2_i1(a, b) result(res)
            import i1
            integer(i1), intent(in) :: a, b
            integer(i1) :: res
        end function f2_i1

        pure function f2_i2(a, b) result(res)
            import i2
            integer(i2), intent(in) :: a, b
            integer(i2) :: res
        end function f2_i2

        pure function f2_i4(a, b) result(res)
            import i4
            integer(i4), intent(in) :: a, b
            integer(i4) :: res
        end function f2_i4

        pure function f2_i8(a, b) result(res)
            import i8
            integer(i8), intent(in) :: a, b
            integer(i8) :: res
        end function f2_i8

        pure function f2_r4(a, b) result(res)
            import r4
            real(r4), intent(in) :: a, b
            real(r4) :: res
        end function f2_r4

        pure function f2_r8(a, b) result(res)
            import r8
            real(r8), intent(in) :: a, b
            real(r8) :: res
        end function f2_r8

        pure function f2_r16(a, b) result(res)
            import r16
            real(r16), intent(in) :: a, b
            real(r16) :: res
        end function f2_r16

        pure function f2_c4(a, b) result(res)
            import r4
            complex(r4), intent(in) :: a, b
            complex(r4) :: res
        end function f2_c4

        pure function f2_c8(a, b) result(res)
            import r8
            complex(r8), intent(in) :: a, b
            complex(r8) :: res
        end function f2_c8

        pure function f2_c16(a, b) result(res)
            import r16
            complex(r16), intent(in) :: a, b
            complex(r16) :: res
        end function f2_c16
    end interface

contains


    pure recursive integer(i1) function foldr_i1(f, start, x) result(res)
        !! Applies function `f` recursively along elements of array `x`.
        !! Equivalent to haskell's right fold. If the list is empty,  the
        !! result is `start`; else apply `f` to the first element and the
        !! result of folding the rest.
        !! This specific procedure is for 1-byte integers.
        !! Overloaded by generic procedure `foldr`.
        procedure(f2_i1) :: f !! Folding function
        integer(i1), intent(in) :: start !! Accumulator start value
        integer(i1), dimension(:), intent(in) :: x !! Input array
        if(size(x) < 1)then
            res = start
        else
            res = f(x(1), foldr(f, start, x(2:)))
        endif
    end function foldr_i1


    pure recursive integer(i2) function foldr_i2(f, start, x) result(res)
        !! Applies function `f` recursively along elements of array `x`.
        !! Equivalent to haskell's right fold. If the list is empty,  the
        !! result is `start`; else apply `f` to the first element and the
        !! result of folding the rest.
        !! This specific procedure is for 2-byte integers.
        !! Overloaded by generic procedure `foldr`.
        procedure(f2_i2) :: f !! Folding function
        integer(i2), intent(in) :: start !! Accumulator start value
        integer(i2), dimension(:), intent(in) :: x !! Input array
        if(size(x) < 1)then
            res = start
        else
            res = f(x(1), foldr(f, start, x(2:)))
        endif
    end function foldr_i2


    pure recursive integer(i4) function foldr_i4(f, start, x) result(res)
        !! Applies function `f` recursively along elements of array `x`.
        !! Equivalent to haskell's right fold. If the list is empty,  the
        !! result is `start`; else apply `f` to the first element and the
        !! result of folding the rest.
        !! This specific procedure is for 4-byte integers.
        !! Overloaded by generic procedure `foldr`.
        procedure(f2_i4) :: f !! Folding function
        integer(i4), intent(in) :: start !! Accumulator start value
        integer(i4), dimension(:), intent(in) :: x !! Input array
        if(size(x) < 1)then
            res = start
        else
            res = f(x(1), foldr(f, start, x(2:)))
        endif
    end function foldr_i4


    pure recursive integer(i8) function foldr_i8(f, start, x) result(res)
        !! Applies function `f` recursively along elements of array `x`.
        !! Equivalent to haskell's right fold. If the list is empty,  the
        !! result is `start`; else apply `f` to the first element and the
        !! result of folding the rest.
        !! This specific procedure is for 8-byte integers.
        !! Overloaded by generic procedure `foldr`.
        procedure(f2_i8) :: f !! Folding function
        integer(i8), intent(in) :: start !! Accumulator start value
        integer(i8), dimension(:), intent(in) :: x !! Input array
        if(size(x) < 1)then
            res = start
        else
            res = f(x(1), foldr(f, start, x(2:)))
        endif
    end function foldr_i8


    pure recursive real(r4) function foldr_r4(f, start, x) result(res)
        !! Applies function `f` recursively along elements of array `x`.
        !! Equivalent to haskell's right fold. If the list is empty,  the
        !! result is `start`; else apply `f` to the first element and the
        !! result of folding the rest.
        !! This specific procedure is for 4-byte reals.
        !! Overloaded by generic procedure `foldr`.
        procedure(f2_r4) :: f !! Folding function
        real(r4), intent(in) :: start !! Accumulator start value
        real(r4), dimension(:), intent(in) :: x !! Input array
        if(size(x) < 1)then
            res = start
        else
            res = f(x(1), foldr(f, start, x(2:)))
        endif
    end function foldr_r4


    pure recursive real(r8) function foldr_r8(f, start, x) result(res)
        !! Applies function `f` recursively along elements of array `x`.
        !! Equivalent to haskell's right fold. If the list is empty,  the
        !! result is `start`; else apply `f` to the first element and the
        !! result of folding the rest.
        !! This specific procedure is for 8-byte reals.
        !! Overloaded by generic procedure `foldr`.
        procedure(f2_r8) :: f !! Folding function
        real(r8), intent(in) :: start !! Accumulator start value
        real(r8), dimension(:), intent(in) :: x !! Input array
        if(size(x) < 1)then
            res = start
        else
            res = f(x(1), foldr(f, start, x(2:)))
        endif
    end function foldr_r8


    pure recursive real(r16) function foldr_r16(f, start, x) result(res)
        !! Applies function `f` recursively along elements of array `x`.
        !! Equivalent to haskell's right fold. If the list is empty,  the
        !! result is `start`; else apply `f` to the first element and the
        !! result of folding the rest.
        !! This specific procedure is for 16-byte reals.
        !! Overloaded by generic procedure `foldr`.
        procedure(f2_r16) :: f !! Folding function
        real(r16), intent(in) :: start !! Accumulator start value
        real(r16), dimension(:), intent(in) :: x !! Input array
        if(size(x) < 1)then
            res = start
        else
            res = f(x(1), foldr(f, start, x(2:)))
        endif
    end function foldr_r16


    pure recursive complex(r4) function foldr_c4(f, start, x) result(res)
        !! Applies function `f` recursively along elements of array `x`.
        !! Equivalent to haskell's right fold. If the list is empty,  the
        !! result is `start`; else apply `f` to the first element and the
        !! result of folding the rest.
        !! This specific procedure is for 4-byte complex numbers.
        !! Overloaded by generic procedure `foldr`.
        procedure(f2_c4) :: f !! Folding function
        complex(r4), intent(in) :: start !! Accumulator start value
        complex(r4), dimension(:), intent(in) :: x !! Input array
        if(size(x) < 1)then
            res = start
        else
            res = f(x(1), foldr(f, start, x(2:)))
        endif
    end function foldr_c4


    pure recursive complex(r8) function foldr_c8(f, start, x) result(res)
        !! Applies function `f` recursively along elements of array `x`.
        !! Equivalent to haskell's right fold. If the list is empty,  the
        !! result is `start`; else apply `f` to the first element and the
        !! result of folding the rest.
        !! This specific procedure is for 8-byte complex numbers.
        !! Overloaded by generic procedure `foldr`.
        procedure(f2_c8) :: f !! Folding function
        complex(r8), intent(in) :: start !! Accumulator start value
        complex(r8), dimension(:), intent(in) :: x !! Input array
        if(size(x) < 1)then
            res = start
        else
            res = f(x(1), foldr(f, start, x(2:)))
        endif
    end function foldr_c8


    pure recursive complex(r16) function foldr_c16(f, start, x) result(res)
        !! Applies function `f` recursively along elements of array `x`.
        !! Equivalent to haskell's right fold. If the list is empty,  the
        !! result is `start`; else apply `f` to the first element and the
        !! result of folding the rest.
        !! This specific procedure is for 16-byte complex numbers.
        !! Overloaded by generic procedure `foldr`.
        procedure(f2_c16) :: f !! Folding function
        complex(r16), intent(in) :: start !! Accumulator start value
        complex(r16), dimension(:), intent(in) :: x !! Input array
        if(size(x) < 1)then
            res = start
        else
            res = f(x(1), foldr(f, start, x(2:)))
        endif
    end function foldr_c16
end module mod_foldr