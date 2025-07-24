!! Returns the first element of array `x`.
module mod_head
    use iso_fortran_env, only : &
        i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
        r4 => real32, r8 => real64, r16 => real128

    implicit none
    private
    public :: head
    public :: operator(.head.)

    interface head
        module procedure head_i1, head_i2, head_i4, head_i8
        module procedure head_r4, head_r8, head_r16
        module procedure head_c4, head_c8, head_c16
        module procedure head_char
    end interface

    interface operator(.head.)
        module procedure op_head_i1, op_head_i2, op_head_i4, op_head_i8
        module procedure op_head_r4, op_head_r8, op_head_r16
        module procedure op_head_c4, op_head_c8, op_head_c16
        module procedure op_head_char
    end interface

contains

    !==== INTEGER ====
    pure integer(i1) function head_i1(x)
        !! This specific procedure is for 1-byte integers.
        integer(i1), dimension(:), intent(in) :: x
        head_i1 = x(1)
    end function head_i1

    pure integer(i2) function head_i2(x)
        !! This specific procedure is for 2-byte integers.
        integer(i2), dimension(:), intent(in) :: x
        head_i2 = x(1)
    end function head_i2

    pure integer(i4) function head_i4(x)
        !! This specific procedure is for 4-byte integers.
        integer(i4), dimension(:), intent(in) :: x
        head_i4 = x(1)
    end function head_i4

    pure integer(i8) function head_i8(x)
        !! This specific procedure is for 8-byte integers.
        integer(i8), dimension(:), intent(in) :: x
        head_i8 = x(1)
    end function head_i8

    !==== REAL ====
    pure real(r4) function head_r4(x)
        !! This specific procedure is for 4-byte reals.
        real(r4), dimension(:), intent(in) :: x
        head_r4 = x(1)
    end function head_r4

    pure real(r8) function head_r8(x)
        !! This specific procedure is for 8-byte reals.
        real(r8), dimension(:), intent(in) :: x
        head_r8 = x(1)
    end function head_r8

    pure real(r16) function head_r16(x)
        !! This specific procedure is for 16-byte reals.
        real(r16), dimension(:), intent(in) :: x
        head_r16 = x(1)
    end function head_r16

    !==== COMPLEX ====
    pure complex(r4) function head_c4(x)
        !! This specific procedure is for 4-byte complex.
        complex(r4), dimension(:), intent(in) :: x
        head_c4 = x(1)
    end function head_c4

    pure complex(r8) function head_c8(x)
        !! This specific procedure is for 8-byte complex.
        complex(r8), dimension(:), intent(in) :: x
        head_c8 = x(1)
    end function head_c8

    pure complex(r16) function head_c16(x)
        !! This specific procedure is for 16-byte complex.
        complex(r16), dimension(:), intent(in) :: x
        head_c16 = x(1)
    end function head_c16

    !==== CHARACTER ====
    pure character(len=1) function head_char(x)
        !! This specific procedure is for character strings.
        character(len=*), intent(in) :: x
        head_char = x(1:1)
    end function head_char

    !==== OPERATOR OVERLOADS ====

    pure integer(i1) function op_head_i1(x)
        integer(i1), dimension(:), intent(in) :: x
        op_head_i1 = head(x)
    end function op_head_i1

    pure integer(i2) function op_head_i2(x)
        integer(i2), dimension(:), intent(in) :: x
        op_head_i2 = head(x)
    end function op_head_i2

    pure integer(i4) function op_head_i4(x)
        integer(i4), dimension(:), intent(in) :: x
        op_head_i4 = head(x)
    end function op_head_i4

    pure integer(i8) function op_head_i8(x)
        integer(i8), dimension(:), intent(in) :: x
        op_head_i8 = head(x)
    end function op_head_i8

    pure real(r4) function op_head_r4(x)
        real(r4), dimension(:), intent(in) :: x
        op_head_r4 = head(x)
    end function op_head_r4

    pure real(r8) function op_head_r8(x)
        real(r8), dimension(:), intent(in) :: x
        op_head_r8 = head(x)
    end function op_head_r8

    pure real(r16) function op_head_r16(x)
        real(r16), dimension(:), intent(in) :: x
        op_head_r16 = head(x)
    end function op_head_r16

    pure complex(r4) function op_head_c4(x)
        complex(r4), dimension(:), intent(in) :: x
        op_head_c4 = head(x)
    end function op_head_c4

    pure complex(r8) function op_head_c8(x)
        complex(r8), dimension(:), intent(in) :: x
        op_head_c8 = head(x)
    end function op_head_c8

    pure complex(r16) function op_head_c16(x)
        complex(r16), dimension(:), intent(in) :: x
        op_head_c16 = head(x)
    end function op_head_c16

    pure character(len=1) function op_head_char(x)
        character(len=*), intent(in) :: x
        op_head_char = head(x)
    end function op_head_char

end module mod_head
