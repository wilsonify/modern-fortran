module mod_iterfold
    use iso_fortran_env, only : i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
            r4 => real32, r8 => real64, r16 => real128
    implicit none
    abstract interface
        pure function f2_i1(x, y) result(res)
            import :: i1
            integer(i1), intent(in) :: x, y
            integer(i1) :: res
        end function f2_i1

        pure function f2_i2(x, y) result(res)
            import :: i2
            integer(i2), intent(in) :: x, y
            integer(i2) :: res
        end function f2_i2

        pure function f2_i4(x, y) result(res)
            import :: i4
            integer(i4), intent(in) :: x, y
            integer(i4) :: res
        end function f2_i4

        pure function f2_i8(x, y) result(res)
            import :: i8
            integer(i8), intent(in) :: x, y
            integer(i8) :: res
        end function f2_i8

        pure function f2_r4(x, y) result(res)
            import :: r4
            real(r4), intent(in) :: x, y
            real(r4) :: res
        end function f2_r4

        pure function f2_r8(x, y) result(res)
            import :: r8
            real(r8), intent(in) :: x, y
            real(r8) :: res
        end function f2_r8

        pure function f2_r16(x, y) result(res)
            import :: r16
            real(r16), intent(in) :: x, y
            real(r16) :: res
        end function f2_r16

        pure function f2_c4(x, y) result(res)
            import :: r4
            complex(r4), intent(in) :: x, y
            complex(r4) :: res
        end function f2_c4

        pure function f2_c8(x, y) result(res)
            import :: r8
            complex(r8), intent(in) :: x, y
            complex(r8) :: res
        end function f2_c8

        pure function f2_c16(x, y) result(res)
            import :: r16
            complex(r16), intent(in) :: x, y
            complex(r16) :: res
        end function f2_c16
    end interface

contains

    pure integer(i1) function iterfold_i1(f, start, x) result(iterfold)
        !! Reduces input array `x` using input function `f(x, y)`.
        !! Initial value is `start`,  if given,  and zero otherwise.
        !! This specific procedure is for 1-byte integers.
        !! Overloaded by generic procedure `iterfold`.
        procedure(f2_i1) :: f !! Folding function
        integer(i1), intent(in) :: start !! Accumulator start value
        integer(i1), dimension(:), intent(in) :: x !! Input array
        integer :: i
        iterfold = start
        do i = 1, size(x)
            iterfold = f(iterfold, x(i))
        enddo
    end function iterfold_i1


    pure integer(i2) function iterfold_i2(f, start, x) result(iterfold)
        !! Reduces input array `x` using input function `f(x, y)`.
        !! Initial value is `start`,  if given,  and zero otherwise.
        !! This specific procedure is for 2-byte integers.
        !! Overloaded by generic procedure `iterfold`.
        procedure(f2_i2) :: f !! Folding function
        integer(i2), intent(in) :: start !! Accumulator start value
        integer(i2), dimension(:), intent(in) :: x !! Input array
        integer :: i
        iterfold = start
        do i = 1, size(x)
            iterfold = f(iterfold, x(i))
        enddo
    end function iterfold_i2


    pure integer(i4) function iterfold_i4(f, start, x) result(iterfold)
        !! Reduces input array `x` using input function `f(x, y)`.
        !! Initial value is `start`,  if given,  and zero otherwise.
        !! This specific procedure is for 4-byte integers.
        !! Overloaded by generic procedure `iterfold`.
        procedure(f2_i4) :: f !! Folding function
        integer(i4), intent(in) :: start !! Accumulator start value
        integer(i4), dimension(:), intent(in) :: x !! Input array
        integer :: i
        iterfold = start
        do i = 1, size(x)
            iterfold = f(iterfold, x(i))
        enddo
    end function iterfold_i4


    pure integer(i8) function iterfold_i8(f, start, x) result(iterfold)
        !! Reduces input array `x` using input function `f(x, y)`.
        !! Initial value is `start`,  if given,  and zero otherwise.
        !! This specific procedure is for 8-byte integers.
        !! Overloaded by generic procedure `iterfold`.
        procedure(f2_i8) :: f !! Folding function
        integer(i8), intent(in) :: start !! Accumulator start value
        integer(i8), dimension(:), intent(in) :: x !! Input array
        integer :: i
        iterfold = start
        do i = 1, size(x)
            iterfold = f(iterfold, x(i))
        enddo
    end function iterfold_i8


    pure real(r4) function iterfold_r4(f, start, x) result(iterfold)
        !! Reduces input array `x` using input function `f(x, y)`.
        !! Initial value is `start`,  if given,  and zero otherwise.
        !! This specific procedure is for 4-byte reals.
        !! Overloaded by generic procedure `iterfold`.
        procedure(f2_r4) :: f !! Folding function
        real(r4), intent(in) :: start !! Accumulator start value
        real(r4), dimension(:), intent(in) :: x !! Input array
        integer :: i
        iterfold = start
        do i = 1, size(x)
            iterfold = f(iterfold, x(i))
        enddo
    end function iterfold_r4


    pure real(r8) function iterfold_r8(f, start, x) result(iterfold)
        !! Reduces input array `x` using input function `f(x, y)`.
        !! Initial value is `start`,  if given,  and zero otherwise.
        !! This specific procedure is for 8-byte reals.
        !! Overloaded by generic procedure `iterfold`.
        procedure(f2_r8) :: f !! Folding function
        real(r8), intent(in) :: start !! Accumulator start value
        real(r8), dimension(:), intent(in) :: x !! Input array
        integer :: i
        iterfold = start
        do i = 1, size(x)
            iterfold = f(iterfold, x(i))
        enddo
    end function iterfold_r8


    pure real(r16) function iterfold_r16(f, start, x) result(iterfold)
        !! Reduces input array `x` using input function `f(x, y)`.
        !! Initial value is `start`,  if given,  and zero otherwise.
        !! This specific procedure is for 16-byte reals.
        !! Overloaded by generic procedure `iterfold`.
        procedure(f2_r16) :: f !! Folding function
        real(r16), intent(in) :: start !! Accumulator start value
        real(r16), dimension(:), intent(in) :: x !! Input array
        integer :: i
        iterfold = start
        do i = 1, size(x)
            iterfold = f(iterfold, x(i))
        enddo
    end function iterfold_r16


    pure complex(r4) function iterfold_c4(f, start, x) result(iterfold)
        !! Reduces input array `x` using input function `f(x, y)`.
        !! Initial value is `start`,  if given,  and zero otherwise.
        !! This specific procedure is for 4-byte complex reals.
        !! Overloaded by generic procedure `iterfold`.
        procedure(f2_c4) :: f !! Folding function
        complex(r4), intent(in) :: start !! Accumulator start value
        complex(r4), dimension(:), intent(in) :: x !! Input array
        integer :: i
        iterfold = start
        do i = 1, size(x)
            iterfold = f(iterfold, x(i))
        enddo
    end function iterfold_c4


    pure complex(r8) function iterfold_c8(f, start, x) result(iterfold)
        !! Reduces input array `x` using input function `f(x, y)`.
        !! Initial value is `start`,  if given,  and zero otherwise.
        !! This specific procedure is for 8-byte complex reals.
        !! Overloaded by generic procedure `iterfold`.
        procedure(f2_c8) :: f !! Folding function
        complex(r8), intent(in) :: start !! Accumulator start value
        complex(r8), dimension(:), intent(in) :: x !! Input array
        integer :: i
        iterfold = start
        do i = 1, size(x)
            iterfold = f(iterfold, x(i))
        enddo
    end function iterfold_c8


    pure complex(r16) function iterfold_c16(f, start, x) result(iterfold)
        !! Reduces input array `x` using input function `f(x, y)`.
        !! Initial value is `start`,  if given,  and zero otherwise.
        !! This specific procedure is for 16-byte complex reals.
        !! Overloaded by generic procedure `iterfold`.
        procedure(f2_c16) :: f !! Folding function
        complex(r16), intent(in) :: start !! Accumulator start value
        complex(r16), dimension(:), intent(in) :: x !! Input array
        integer :: i
        iterfold = start
        do i = 1, size(x)
            iterfold = f(iterfold, x(i))
        enddo
    end function iterfold_c16


end module mod_iterfold