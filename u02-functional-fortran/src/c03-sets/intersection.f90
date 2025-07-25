module mod_intersection
    use iso_fortran_env, only : i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
            r4 => real32, r8 => real64, r16 => real128
    use mod_set
    use mod_empty
    implicit none
    private
    public :: intersection

    interface intersection
        module procedure intersection_i1, intersection_i2, intersection_i4, intersection_i8
        module procedure intersection_r4, intersection_r8, intersection_r16
        module procedure intersection_c4, intersection_c8, intersection_c16
        module procedure intersection_char
    end interface
    public :: operator(.intersection.)
    interface operator(.intersection.)
        module procedure :: intersection_i1, intersection_i2, intersection_i4, intersection_i8
        module procedure :: intersection_r4, intersection_r8, intersection_r16
        module procedure :: intersection_c4, intersection_c8, intersection_c16
        module procedure :: intersection_char
    end interface

contains

    pure function intersection_i1(x, y) result(res)
        !! Returns a set intersection of two arrays.
        !! This specific procedure is for 1-byte integers.
        !! Overloaded by generic procedure `intersection`.
        integer(i1), dimension(:), intent(in) :: x !! First input array
        integer(i1), dimension(:), intent(in) :: y !! Second input array
        integer(i1), dimension(:), allocatable :: res
        integer(i1), dimension(:), allocatable :: a, b
        integer(i4) :: n
        a = set(x)
        b = set(y)
        res = empty(1_i1)
        if(size(a) > size(b))then
            do concurrent (n = 1:size(b))
                if(any(a == b(n)))res = [res, b(n)]
            enddo
        else
            do concurrent (n = 1:size(a))
                if(any(b == a(n)))res = [res, a(n)]
            enddo
        endif
    end function intersection_i1


    pure function intersection_i2(x, y) result(res)
        !! Returns a set intersection of two arrays.
        !! This specific procedure is for 2-byte integers.
        !! Overloaded by generic procedure `intersection`.
        integer(i2), dimension(:), intent(in) :: x !! First input array
        integer(i2), dimension(:), intent(in) :: y !! Second input array
        integer(i2), dimension(:), allocatable :: res
        integer(i2), dimension(:), allocatable :: a, b
        integer(i4) :: n
        a = set(x)
        b = set(y)
        res = empty(1_i2)
        if(size(a) > size(b))then
            do concurrent (n = 1:size(b))
                if(any(a == b(n)))res = [res, b(n)]
            enddo
        else
            do concurrent (n = 1:size(a))
                if(any(b == a(n)))res = [res, a(n)]
            enddo
        endif
    end function intersection_i2


    pure function intersection_i4(x, y) result(res)
        !! Returns a set intersection of two arrays.
        !! This specific procedure is for 4-byte integers.
        !! Overloaded by generic procedure `intersection`.
        integer(i4), dimension(:), intent(in) :: x !! First input array
        integer(i4), dimension(:), intent(in) :: y !! Second input array
        integer(i4), dimension(:), allocatable :: res
        integer(i4), dimension(:), allocatable :: a, b
        integer(i4) :: n
        a = set(x)
        b = set(y)
        res = empty(1_i4)
        if(size(a) > size(b))then
            do concurrent (n = 1:size(b))
                if(any(a == b(n)))res = [res, b(n)]
            enddo
        else
            do concurrent (n = 1:size(a))
                if(any(b == a(n)))res = [res, a(n)]
            enddo
        endif
    end function intersection_i4


    pure function intersection_i8(x, y) result(res)
        !! Returns a set intersection of two arrays.
        !! This specific procedure is for 8-byte integers.
        !! Overloaded by generic procedure `intersection`.
        integer(i8), dimension(:), intent(in) :: x !! First input array
        integer(i8), dimension(:), intent(in) :: y !! Second input array
        integer(i8), dimension(:), allocatable :: res
        integer(i8), dimension(:), allocatable :: a, b
        integer(i4) :: n
        a = set(x)
        b = set(y)
        res = empty(1_i8)
        if(size(a) > size(b))then
            do concurrent (n = 1:size(b))
                if(any(a == b(n)))res = [res, b(n)]
            enddo
        else
            do concurrent (n = 1:size(a))
                if(any(b == a(n)))res = [res, a(n)]
            enddo
        endif
    end function intersection_i8


    pure function intersection_r4(x, y) result(res)
        !! Returns a set intersection of two arrays.
        !! This specific procedure is for 4-byte reals.
        !! Overloaded by generic procedure `intersection`.
        real(r4), dimension(:), intent(in) :: x !! First input array
        real(r4), dimension(:), intent(in) :: y !! Second input array
        real(r4), dimension(:), allocatable :: res
        real(r4), dimension(:), allocatable :: a, b
        integer(i4) :: n
        a = set(x)
        b = set(y)
        res = empty(1._r4)
        if(size(a) > size(b))then
            do concurrent (n = 1:size(b))
                if(any(a == b(n)))res = [res, b(n)]
            enddo
        else
            do concurrent (n = 1:size(a))
                if(any(b == a(n)))res = [res, a(n)]
            enddo
        endif
    end function intersection_r4


    pure function intersection_r8(x, y) result(res)
        !! Returns a set intersection of two arrays.
        !! This specific procedure is for 8-byte reals.
        !! Overloaded by generic procedure `intersection`.
        real(r8), dimension(:), intent(in) :: x !! First input array
        real(r8), dimension(:), intent(in) :: y !! Second input array
        real(r8), dimension(:), allocatable :: res
        real(r8), dimension(:), allocatable :: a, b
        integer(i4) :: n
        a = set(x)
        b = set(y)
        res = empty(1._r8)
        if(size(a) > size(b))then
            do concurrent (n = 1:size(b))
                if(any(a == b(n)))res = [res, b(n)]
            enddo
        else
            do concurrent (n = 1:size(a))
                if(any(b == a(n)))res = [res, a(n)]
            enddo
        endif
    end function intersection_r8


    pure function intersection_r16(x, y) result(res)
        !! Returns a set intersection of two arrays.
        !! This specific procedure is for 16-byte reals.
        !! Overloaded by generic procedure `intersection`.
        real(r16), dimension(:), intent(in) :: x !! First input array
        real(r16), dimension(:), intent(in) :: y !! Second input array
        real(r16), dimension(:), allocatable :: res
        real(r16), dimension(:), allocatable :: a, b
        integer(i4) :: n
        a = set(x)
        b = set(y)
        res = empty(1._r16)
        if(size(a) > size(b))then
            do concurrent (n = 1:size(b))
                if(any(a == b(n)))res = [res, b(n)]
            enddo
        else
            do concurrent (n = 1:size(a))
                if(any(b == a(n)))res = [res, a(n)]
            enddo
        endif
    end function intersection_r16


    pure function intersection_c4(x, y) result(res)
        !! Returns a set intersection of two arrays.
        !! This specific procedure is for 4-byte complex numbers.
        !! Overloaded by generic procedure `intersection`.
        complex(r4), dimension(:), intent(in) :: x !! First input array
        complex(r4), dimension(:), intent(in) :: y !! Second input array
        complex(r4), dimension(:), allocatable :: res
        complex(r4), dimension(:), allocatable :: a, b
        integer(i4) :: n
        a = set(x)
        b = set(y)
        res = empty(cmplx(1._r4, 0._r4))
        if(size(a) > size(b))then
            do concurrent (n = 1:size(b))
                if(any(a == b(n)))res = [res, b(n)]
            enddo
        else
            do concurrent (n = 1:size(a))
                if(any(b == a(n)))res = [res, a(n)]
            enddo
        endif
    end function intersection_c4


    pure function intersection_c8(x, y) result(res)
        !! Returns a set intersection of two arrays.
        !! This specific procedure is for 8-byte complex numbers.
        !! Overloaded by generic procedure `intersection`.
        complex(r8), dimension(:), intent(in) :: x !! First input array
        complex(r8), dimension(:), intent(in) :: y !! Second input array
        complex(r8), dimension(:), allocatable :: res
        complex(r8), dimension(:), allocatable :: a, b
        integer(i4) :: n
        a = set(x)
        b = set(y)
        res = empty(cmplx(1._r8, 0._r8))
        if(size(a) > size(b))then
            do concurrent (n = 1:size(b))
                if(any(a == b(n)))res = [res, b(n)]
            enddo
        else
            do concurrent (n = 1:size(a))
                if(any(b == a(n)))res = [res, a(n)]
            enddo
        endif
    end function intersection_c8


    pure function intersection_c16(x, y) result(res)
        !! Returns a set intersection of two arrays.
        !! This specific procedure is for 16-byte complex numbers.
        !! Overloaded by generic procedure `intersection`.
        complex(r16), dimension(:), intent(in) :: x !! First input array
        complex(r16), dimension(:), intent(in) :: y !! Second input array
        complex(r16), dimension(:), allocatable :: res
        complex(r16), dimension(:), allocatable :: a, b
        integer(i4) :: n
        a = set(x)
        b = set(y)
        res = empty(cmplx(1._r16, 0._r16))
        if(size(a) > size(b))then
            do concurrent (n = 1:size(b))
                if(any(a == b(n)))res = [res, b(n)]
            enddo
        else
            do concurrent (n = 1:size(a))
                if(any(b == a(n)))res = [res, a(n)]
            enddo
        endif
    end function intersection_c16


    pure function intersection_char(x, y) result(res)
        !! Returns a set intersection of two character strings.
        !! Overloaded by generic procedure `intersection`.
        character(len = *), intent(in) :: x !! First input array
        character(len = *), intent(in) :: y !! Second input array
        character(len = :), allocatable :: res
        character(len = :), allocatable :: a, b
        integer(i4) :: n
        a = set(x)
        b = set(y)
        res = ''
        if (len(a) > len(b)) then
            do concurrent (n = 1:len(b))
                if (scan(b(n:n), a) > 0) res = res // b(n:n)
            end do
        else
            do concurrent (n = 1:len(a))
                if (scan(a(n:n), b) > 0) res = res // a(n:n)
            end do
        end if
    end function intersection_char
end module mod_intersection