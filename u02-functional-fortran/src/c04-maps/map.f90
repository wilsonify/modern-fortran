module mod_map
contains

    pure function map_i1(f, x) result(map)
        !! Returns `f(x)` given input function `f` and array `x`.
        !! This specific procedure is for 1-byte integers.
        !! Overloaded by generic procedure `map`.
        procedure(f_i1) :: f !! Mapping function
        integer(i1), dimension(:), intent(in) :: x !! Input array
        integer(i1), dimension(size(x)) :: map
        integer(i4) :: i
        map = [(f(x(i)), i = 1, size(x))]
    end function map_i1


    pure function map_i2(f, x) result(map)
        !! Returns `f(x)` given input function `f` and array `x`.
        !! This specific procedure is for 2-byte integers.
        !! Overloaded by generic procedure `map`.
        procedure(f_i2) :: f !! Mapping function
        integer(i2), dimension(:), intent(in) :: x !! Input array
        integer(i2), dimension(size(x)) :: map
        integer(i4) :: i
        map = [(f(x(i)), i = 1, size(x))]
    end function map_i2


    pure function map_i4(f, x) result(map)
        !! Returns `f(x)` given input function `f` and array `x`.
        !! This specific procedure is for 4-byte integers.
        !! Overloaded by generic procedure `map`.
        procedure(f_i4) :: f !! Mapping function
        integer(i4), dimension(:), intent(in) :: x !! Input array
        integer(i4), dimension(size(x)) :: map
        integer(i4) :: i
        map = [(f(x(i)), i = 1, size(x))]
    end function map_i4


    pure function map_i8(f, x) result(map)
        !! Returns `f(x)` given input function `f` and array `x`.
        !! This specific procedure is for 8-byte integers.
        !! Overloaded by generic procedure `map`.
        procedure(f_i8) :: f !! Mapping function
        integer(i8), dimension(:), intent(in) :: x
        integer(i8), dimension(size(x)) :: map
        integer(i4) :: i
        map = [(f(x(i)), i = 1, size(x))]
    end function map_i8


    pure function map_r4(f, x) result(map)
        !! Returns `f(x)` given input function `f` and array `x`.
        !! This specific procedure is for 4-byte reals.
        !! Overloaded by generic procedure `map`.
        procedure(f_r4) :: f !! Mapping function
        real(r4), dimension(:), intent(in) :: x !! Input array
        real(r4), dimension(size(x)) :: map
        integer(i4) :: i
        map = [(f(x(i)), i = 1, size(x))]
    end function map_r4


    pure function map_r8(f, x) result(map)
        !! Returns `f(x)` given input function `f` and array `x`.
        !! This specific procedure is for 8-byte reals.
        !! Overloaded by generic procedure `map`.
        procedure(f_r8) :: f !! Mapping function
        real(r8), dimension(:), intent(in) :: x !! Input array
        real(r8), dimension(size(x)) :: map
        integer(i4) :: i
        map = [(f(x(i)), i = 1, size(x))]
    end function map_r8


    pure function map_r16(f, x) result(map)
        !! Returns `f(x)` given input function `f` and array `x`.
        !! This specific procedure is for 16-byte reals.
        !! Overloaded by generic procedure `map`.
        procedure(f_r16) :: f !! Mapping function
        real(r16), dimension(:), intent(in) :: x !! Input array
        real(r16), dimension(size(x)) :: map
        integer(i4) :: i
        map = [(f(x(i)), i = 1, size(x))]
    end function map_r16


    pure function map_c4(f, x) result(map)
        !! Returns `f(x)` given input function `f` and array `x`.
        !! This specific procedure is for 4-byte complex reals.
        !! Overloaded by generic procedure `map`.
        procedure(f_c4) :: f !! Mapping function
        complex(r4), dimension(:), intent(in) :: x !! Input array
        complex(r4), dimension(size(x)) :: map
        integer(i4) :: i
        map = [(f(x(i)), i = 1, size(x))]
    end function map_c4


    pure function map_c8(f, x) result(map)
        !! Returns `f(x)` given input function `f` and array `x`.
        !! This specific procedure is for 8-byte complex reals.
        !! Overloaded by generic procedure `map`.
        procedure(f_c8) :: f !! Mapping function
        complex(r8), dimension(:), intent(in) :: x !! Input array
        complex(r8), dimension(size(x)) :: map
        integer(i4) :: i
        map = [(f(x(i)), i = 1, size(x))]
    end function map_c8


    pure function map_c16(f, x) result(map)
        !! Returns `f(x)` given input function `f` and array `x`.
        !! This specific procedure is for 16-byte complex reals.
        !! Overloaded by generic procedure `map`.
        procedure(f_c16) :: f !! Mapping function
        complex(r16), dimension(:), intent(in) :: x !! Input array
        complex(r16), dimension(size(x)) :: map
        integer(i4) :: i
        map = [(f(x(i)), i = 1, size(x))]
    end function map_c16
end module mod_map