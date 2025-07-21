module mod_unfold
    use iso_fortran_env, only : i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
            r4 => real32, r8 => real64, r16 => real128
    use mod_last
    implicit none

    abstract interface
        pure function f_i1(x) result(res)
            import :: i1
            integer(i1), intent(in) :: x
            integer(i1) :: res
        end function f_i1

        pure function f_i2(x) result(res)
            import :: i2
            integer(i2), intent(in) :: x
            integer(i2) :: res
        end function f_i2

        pure function f_i4(x) result(res)
            import :: i4
            integer(i4), intent(in) :: x
            integer(i4) :: res
        end function f_i4

        pure function f_i8(x) result(res)
            import :: i8
            integer(i8), intent(in) :: x
            integer(i8) :: res
        end function f_i8

        pure function f_r4(x) result(res)
            import :: r4
            real(r4), intent(in) :: x
            real(r4) :: res
        end function f_r4

        pure function f_r8(x) result(res)
            import :: r8
            real(r8), intent(in) :: x
            real(r8) :: res
        end function f_r8

        pure function f_r16(x) result(res)
            import :: r16
            real(r16), intent(in) :: x
            real(r16) :: res
        end function f_r16

        pure function f_c4(x) result(res)
            import :: r4
            complex(r4), intent(in) :: x
            complex(r4) :: res
        end function f_c4

        pure function f_c8(x) result(res)
            import :: r8
            complex(r8), intent(in) :: x
            complex(r8) :: res
        end function f_c8

        pure function f_c16(x) result(res)
            import :: r16
            complex(r16), intent(in) :: x
            complex(r16) :: res
        end function f_c16
    end interface
contains

    pure recursive function unfold_i1(f, x, len) result(res)
        !! Generates an array of length `len` by unfolding starting
        !! array `x` using input function `f`.
        !! This specific procedure is for 1-byte integers.
        !! Overloaded by generic procedure `unfold`.
        procedure(f_i1) :: f !! Unfolding function
        integer(i1), dimension(:), intent(in) :: x !! Start value
        integer(i1), intent(in) :: len !! Array length to return
        integer(i1), dimension(:), allocatable :: res
        if(size(x) >= len)then
            res = x
        else
            res = unfold(f, [x, f(last(x))], len)
        endif
    end function unfold_i1


    pure recursive function unfold_i2(f, x, len) result(res)
        !! Generates an array of length `len` by unfolding starting
        !! array `x` using input function `f`.
        !! This specific procedure is for 2-byte integers.
        !! Overloaded by generic procedure `unfold`.
        procedure(f_i2) :: f !! Unfolding function
        integer(i2), dimension(:), intent(in) :: x !! Start value
        integer(i2), intent(in) :: len !! Array length to return
        integer(i2), dimension(:), allocatable :: res
        if(size(x) >= len)then
            res = x
        else
            res = unfold(f, [x, f(last(x))], len)
        endif
    end function unfold_i2


    pure recursive function unfold_i4(f, x, len) result(res)
        !! Generates an array of length `len` by unfolding starting
        !! array `x` using input function `f`.
        !! This specific procedure is for 4-byte integers.
        !! Overloaded by generic procedure `unfold`.
        procedure(f_i4) :: f !! Unfolding function
        integer(i4), dimension(:), intent(in) :: x !! Start value
        integer(i4), intent(in) :: len !! Array length to return
        integer(i4), dimension(:), allocatable :: res
        if(size(x) >= len)then
            res = x
        else
            res = unfold(f, [x, f(last(x))], len)
        endif
    end function unfold_i4


    pure recursive function unfold_i8(f, x, len) result(res)
        !! Generates an array of length `len` by unfolding starting
        !! array `x` using input function `f`.
        !! This specific procedure is for 8-byte integers.
        !! Overloaded by generic procedure `unfold`.
        procedure(f_i8) :: f !! Unfolding function
        integer(i8), dimension(:), intent(in) :: x !! Start value
        integer(i8), intent(in) :: len !! Array length to return
        integer(i8), dimension(:), allocatable :: res
        if(size(x) >= len)then
            res = x
        else
            res = unfold(f, [x, f(last(x))], len)
        endif
    end function unfold_i8


    pure recursive function unfold_r4(f, x, len) result(res)
        !! Generates an array of length `len` by unfolding starting
        !! array `x` using input function `f`.
        !! This specific procedure is for 4-byte reals.
        !! Overloaded by generic procedure `unfold`.
        procedure(f_r4) :: f !! Unfolding function
        real(r4), dimension(:), intent(in) :: x !! Start value
        integer(i4), intent(in) :: len !! Array length to return
        real(r4), dimension(:), allocatable :: res
        if(size(x) >= len)then
            res = x
        else
            res = unfold(f, [x, f(last(x))], len)
        endif
    end function unfold_r4


    pure recursive function unfold_r8(f, x, len) result(res)
        !! Generates an array of length `len` by unfolding starting
        !! array `x` using input function `f`.
        !! This specific procedure is for 8-byte reals.
        !! Overloaded by generic procedure `unfold`.
        procedure(f_r8) :: f !! Unfolding function
        real(r8), dimension(:), intent(in) :: x !! Start value
        integer(i4), intent(in) :: len !! Array length to return
        real(r8), dimension(:), allocatable :: res
        if(size(x) >= len)then
            res = x
        else
            res = unfold(f, [x, f(last(x))], len)
        endif
    end function unfold_r8


    pure recursive function unfold_r16(f, x, len) result(res)
        !! Generates an array of length `len` by unfolding starting
        !! array `x` using input function `f`.
        !! This specific procedure is for 16-byte reals.
        !! Overloaded by generic procedure `unfold`.
        procedure(f_r16) :: f !! Unfolding function
        real(r16), dimension(:), intent(in) :: x !! Start value
        integer(i4), intent(in) :: len !! Array length to return
        real(r16), dimension(:), allocatable :: res
        if(size(x) >= len)then
            res = x
        else
            res = unfold(f, [x, f(last(x))], len)
        endif
    end function unfold_r16


    pure recursive function unfold_c4(f, x, len) result(res)
        !! Generates an array of length `len` by unfolding starting
        !! array `x` using input function `f`.
        !! This specific procedure is for 4-byte complex reals.
        !! Overloaded by generic procedure `unfold`.
        procedure(f_c4) :: f !! Unfolding function
        complex(r4), dimension(:), intent(in) :: x !! Start value
        integer(i4), intent(in) :: len !! Array length to return
        complex(r4), dimension(:), allocatable :: res
        if(size(x) >= len)then
            res = x
        else
            res = unfold(f, [x, f(last(x))], len)
        endif
    end function unfold_c4


    pure recursive function unfold_c8(f, x, len) result(res)
        !! Generates an array of length `len` by unfolding starting
        !! array `x` using input function `f`.
        !! This specific procedure is for 8-byte complex reals.
        !! Overloaded by generic procedure `unfold`.
        procedure(f_c8) :: f !! Unfolding function
        complex(r8), dimension(:), intent(in) :: x !! Start value
        integer(i4), intent(in) :: len !! Array length to return
        complex(r8), dimension(:), allocatable :: res
        if(size(x) >= len)then
            res = x
        else
            res = unfold(f, [x, f(last(x))], len)
        endif
    end function unfold_c8


    pure recursive function unfold_c16(f, x, len) result(res)
        !! Generates an array of length `len` by unfolding starting
        !! array `x` using input function `f`.
        !! This specific procedure is for 16-byte complex reals.
        !! Overloaded by generic procedure `unfold`.
        procedure(f_c16) :: f !! Unfolding function
        complex(r16), dimension(:), intent(in) :: x !! Start value
        integer(i4), intent(in) :: len !! Array length to return
        complex(r16), dimension(:), allocatable :: res
        if(size(x) >= len)then
            res = x
        else
            res = unfold(f, [x, f(last(x))], len)
        endif
    end function unfold_c16
end module mod_unfold