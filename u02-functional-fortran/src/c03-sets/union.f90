module mod_union
    use iso_fortran_env, only : i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
            r4 => real32, r8 => real64, r16 => real128
    use mod_set
    private
    public :: union
    interface union
        module procedure :: union_i1, union_i2, union_i4, union_i8
        module procedure :: union_r4, union_r8, union_r16
        module procedure :: union_c4, union_c8, union_c16
        module procedure :: union_char
    end interface union
    public :: operator(.union.)

    interface operator(.union.)
        module procedure :: union_i1, union_i2, union_i4, union_i8
        module procedure :: union_r4, union_r8, union_r16
        module procedure :: union_c4, union_c8, union_c16
        module procedure :: union_char
    end interface
contains

    pure function union_i1(x, y) result(union)
        !! Returns a union of two arrays.
        !! This specific procedure is for 1-byte integers.
        !! Overloaded by generic procedure `union`.
        integer(i1), dimension(:), intent(in) :: x !! First input array
        integer(i1), dimension(:), intent(in) :: y !! Second input array
        integer(i1), dimension(:), allocatable :: union
        union = set([x, y])
    end function union_i1


    pure function union_i2(x, y) result(union)
        !! Returns a union of two arrays.
        !! This specific procedure is for 2-byte integers.
        !! Overloaded by generic procedure `union`.
        integer(i2), dimension(:), intent(in) :: x !! First input array
        integer(i2), dimension(:), intent(in) :: y !! Second input array
        integer(i2), dimension(:), allocatable :: union
        union = set([x, y])
    end function union_i2


    pure function union_i4(x, y) result(union)
        !! Returns a union of two arrays.
        !! This specific procedure is for 4-byte integers.
        !! Overloaded by generic procedure `union`.
        integer(i4), dimension(:), intent(in) :: x !! First input array
        integer(i4), dimension(:), intent(in) :: y !! Second input array
        integer(i4), dimension(:), allocatable :: union
        union = set([x, y])
    end function union_i4


    pure function union_i8(x, y) result(union)
        !! Returns a union of two arrays.
        !! This specific procedure is for 8-byte integers.
        !! Overloaded by generic procedure `union`.
        integer(i8), dimension(:), intent(in) :: x !! First input array
        integer(i8), dimension(:), intent(in) :: y !! Second input array
        integer(i8), dimension(:), allocatable :: union
        union = set([x, y])
    end function union_i8


    pure function union_r4(x, y) result(union)
        !! Returns a union of two arrays.
        !! This specific procedure is for 4-byte reals.
        !! Overloaded by generic procedure `union`.
        real(r4), dimension(:), intent(in) :: x !! First input array
        real(r4), dimension(:), intent(in) :: y !! Second input array
        real(r4), dimension(:), allocatable :: union
        union = set([x, y])
    end function union_r4


    pure function union_r8(x, y) result(union)
        !! Returns a union of two arrays.
        !! This specific procedure is for 8-byte reals.
        !! Overloaded by generic procedure `union`.
        real(r8), dimension(:), intent(in) :: x !! First input array
        real(r8), dimension(:), intent(in) :: y !! Second input array
        real(r8), dimension(:), allocatable :: union
        union = set([x, y])
    end function union_r8


    pure function union_r16(x, y) result(union)
        !! Returns a union of two arrays.
        !! This specific procedure is for 16-byte reals.
        !! Overloaded by generic procedure `union`.
        real(r16), dimension(:), intent(in) :: x !! First input array
        real(r16), dimension(:), intent(in) :: y !! Second input array
        real(r16), dimension(:), allocatable :: union
        union = set([x, y])
    end function union_r16


    pure function union_c4(x, y) result(union)
        !! Returns a union of two arrays.
        !! This specific procedure is for 4-byte complex numbers.
        !! Overloaded by generic procedure `union`.
        complex(r4), dimension(:), intent(in) :: x !! First input array
        complex(r4), dimension(:), intent(in) :: y !! Second input array
        complex(r4), dimension(:), allocatable :: union
        union = set([x, y])
    end function union_c4


    pure function union_c8(x, y) result(union)
        !! Returns a union of two arrays.
        !! This specific procedure is for 8-byte complex numbers.
        !! Overloaded by generic procedure `union`.
        complex(r8), dimension(:), intent(in) :: x !! First input array
        complex(r8), dimension(:), intent(in) :: y !! Second input array
        complex(r8), dimension(:), allocatable :: union
        union = set([x, y])
    end function union_c8


    pure function union_c16(x, y) result(union)
        !! Returns a union of two arrays.
        !! This specific procedure is for 16-byte complex numbers.
        !! Overloaded by generic procedure `union`.
        complex(r16), dimension(:), intent(in) :: x !! First input array
        complex(r16), dimension(:), intent(in) :: y !! Second input array
        complex(r16), dimension(:), allocatable :: union
        union = set([x, y])
    end function union_c16


    pure function union_char(x, y) result(union)
        !! Returns a union of two character strings.
        !! This specific procedure is for 16-byte complex numbers.
        !! Overloaded by generic procedure `union`.
        character(len = *), intent(in) :: x !! First input array
        character(len = *), intent(in) :: y !! Second input array
        character(len = :), allocatable :: union
        union = set(x // y)
    end function union_char
end module mod_union