module mod_map
    use iso_fortran_env, only : i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
            r4 => real32, r8 => real64, r16 => real128
    implicit none
    private
    public :: map

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
    interface map
        module procedure :: map_i1, map_i2, map_i4, map_i8
        module procedure :: map_r4, map_r8, map_r16
        module procedure :: map_c4, map_c8, map_c16
    end interface map
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
        !! This specific procedure is for 4-byte complex numbers.
        !! Overloaded by generic procedure `map`.
        procedure(f_c4) :: f !! Mapping function
        complex(r4), dimension(:), intent(in) :: x !! Input array
        complex(r4), dimension(size(x)) :: map
        integer(i4) :: i
        map = [(f(x(i)), i = 1, size(x))]
    end function map_c4


    pure function map_c8(f, x) result(map)
        !! Returns `f(x)` given input function `f` and array `x`.
        !! This specific procedure is for 8-byte complex numbers.
        !! Overloaded by generic procedure `map`.
        procedure(f_c8) :: f !! Mapping function
        complex(r8), dimension(:), intent(in) :: x !! Input array
        complex(r8), dimension(size(x)) :: map
        integer(i4) :: i
        map = [(f(x(i)), i = 1, size(x))]
    end function map_c8


    pure function map_c16(f, x) result(map)
        !! Returns `f(x)` given input function `f` and array `x`.
        !! This specific procedure is for 16-byte complex numbers.
        !! Overloaded by generic procedure `map`.
        procedure(f_c16) :: f !! Mapping function
        complex(r16), dimension(:), intent(in) :: x !! Input array
        complex(r16), dimension(size(x)) :: map
        integer(i4) :: i
        map = [(f(x(i)), i = 1, size(x))]
    end function map_c16
end module mod_map