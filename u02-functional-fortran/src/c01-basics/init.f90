module mod_init
    use iso_fortran_env, only : i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
            r4 => real32, r8 => real64, r16 => real128

    implicit none
    private
    interface init
        module procedure init_i1, init_i2, init_i4, init_i8, &
                init_r4, init_r8, init_r16, init_c4, init_c8, init_c16, init_char
    end interface init


contains

    pure function init_i1(x) result(init)
        !! Returns all elements of `x` but the last.
        !! This specific procedure is for 1-byte integers.
        !! Overloaded by generic procedure `init`.
        integer(i1), dimension(:), intent(in) :: x !! Input array
        integer(i1), dimension(size(x) - 1) :: init
        init = x(:size(x) - 1)
    end function init_i1


    pure function init_i2(x) result(init)
        !! Returns all elements of `x` but the last.
        !! This specific procedure is for 2-byte integers.
        !! Overloaded by generic procedure `init`.
        integer(i2), dimension(:), intent(in) :: x !! Input array
        integer(i2), dimension(size(x) - 1) :: init
        init = x(:size(x) - 1)
    end function init_i2


    pure function init_i4(x) result(init)
        !! Returns all elements of `x` but the last.
        !! This specific procedure is for 4-byte integers.
        !! Overloaded by generic procedure `init`.
        integer(i4), dimension(:), intent(in) :: x !! Input array
        integer(i4), dimension(size(x) - 1) :: init
        init = x(:size(x) - 1)
    end function init_i4


    pure function init_i8(x) result(init)
        !! Returns all elements of `x` but the last.
        !! This specific procedure is for 8-byte integers.
        !! Overloaded by generic procedure `init`.
        integer(i8), dimension(:), intent(in) :: x !! Input array
        integer(i8), dimension(size(x) - 1) :: init
        init = x(:size(x) - 1)
    end function init_i8


    pure function init_r4(x) result(init)
        !! Returns all elements of `x` but the last.
        !! This specific procedure is for 4-byte reals.
        !! Overloaded by generic procedure `init`.
        real(r4), dimension(:), intent(in) :: x !! Input array
        real(r4), dimension(size(x) - 1) :: init
        init = x(:size(x) - 1)
    end function init_r4


    pure function init_r8(x) result(init)
        !! Returns all elements of `x` but the last.
        !! This specific procedure is for 8-byte reals.
        !! Overloaded by generic procedure `init`.
        real(r8), dimension(:), intent(in) :: x !! Input array
        real(r8), dimension(size(x) - 1) :: init
        init = x(:size(x) - 1)
    end function init_r8


    pure function init_r16(x) result(init)
        !! Returns all elements of `x` but the last.
        !! This specific procedure is for 8-byte reals.
        !! Overloaded by generic procedure `init`.
        real(r16), dimension(:), intent(in) :: x !! Input array
        real(r16), dimension(size(x) - 1) :: init
        init = x(:size(x) - 1)
    end function init_r16


    pure function init_c4(x) result(init)
        !! Returns all elements of `x` but the last.
        !! This specific procedure is for 4-byte complex reals.
        !! Overloaded by generic procedure `init`.
        complex(r4), dimension(:), intent(in) :: x !! Input array
        complex(r4), dimension(size(x) - 1) :: init
        init = x(:size(x) - 1)
    end function init_c4


    pure function init_c8(x) result(init)
        !! Returns all elements of `x` but the last.
        !! This specific procedure is for 8-byte complex reals.
        !! Overloaded by generic procedure `init`.
        complex(r8), dimension(:), intent(in) :: x !! Input array
        complex(r8), dimension(size(x) - 1) :: init
        init = x(:size(x) - 1)
    end function init_c8


    pure function init_c16(x) result(init)
        !! Returns all elements of `x` but the last.
        !! This specific procedure is for 8-byte complex reals.
        !! Overloaded by generic procedure `init`.
        complex(r16), dimension(:), intent(in) :: x !! Input array
        complex(r16), dimension(size(x) - 1) :: init
        init = x(:size(x) - 1)
    end function init_c16


    pure function init_char(x) result(init)
        !! Returns all elements of `x` but the last.
        !! This specific procedure is for character string.
        !! Overloaded by generic procedure `init`.
        character(len = *), intent(in) :: x !! Input array
        character(len = len(x) - 1) :: init
        init = x(:len(x) - 1)
    end function init_char


end module mod_init