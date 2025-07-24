module mod_foldl
    use iso_fortran_env, only : i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
                                 r4 => real32, r8 => real64, r16 => real128
    implicit none
    private

    public :: foldl

    interface foldl
        module procedure foldl_i1, foldl_i2, foldl_i4, foldl_i8, &
                         foldl_r4, foldl_r8, foldl_r16, &
                         foldl_c4, foldl_c8, foldl_c16
    end interface foldl

    ! Abstract interfaces for binary functions
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
        !! This specific procedure is for 16-byte reals.
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
        !! This specific procedure is for 4-byte complex numbers.
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
        !! This specific procedure is for 8-byte complex numbers.
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
        !! This specific procedure is for 8-byte complex numbers.
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