!! Returns all elements of `x` but the last.
module mod_init
    use iso_fortran_env, only : &
        i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
        r4 => real32, r8 => real64, r16 => real128

    implicit none
    private
    public :: init
    public :: operator(.init.)

    interface init
        module procedure init_i1, init_i2, init_i4, init_i8
        module procedure init_r4, init_r8, init_r16
        module procedure init_c4, init_c8, init_c16
        module procedure init_char
    end interface

    interface operator(.init.)
        module procedure op_init_i1, op_init_i2, op_init_i4, op_init_i8
        module procedure op_init_r4, op_init_r8, op_init_r16
        module procedure op_init_c4, op_init_c8, op_init_c16
        module procedure op_init_char
    end interface

contains

    !===== INTEGER =====
    pure function init_i1(x) result(init)
        !! This specific procedure is for 1-byte integers.
        integer(i1), dimension(:), intent(in) :: x
        integer(i1), dimension(:), allocatable :: init
        if (size(x) > 1) then
            allocate(init(size(x) - 1))
            init = x(:size(x) - 1)
        else
            allocate(init(0))
        end if
    end function init_i1

    pure function init_i2(x) result(init)
        !! This specific procedure is for 2-byte integers.
        integer(i2), dimension(:), intent(in) :: x
        integer(i2), dimension(:), allocatable :: init
        if (size(x) > 1) then
            allocate(init(size(x) - 1))
            init = x(:size(x) - 1)
        else
            allocate(init(0))
        end if
    end function init_i2

    pure function init_i4(x) result(init)
        !! This specific procedure is for 4-byte integers.
        integer(i4), dimension(:), intent(in) :: x
        integer(i4), dimension(:), allocatable :: init
        if (size(x) > 1) then
            allocate(init(size(x) - 1))
            init = x(:size(x) - 1)
        else
            allocate(init(0))
        end if
    end function init_i4

    pure function init_i8(x) result(init)
        !! This specific procedure is for 8-byte integers.
        integer(i8), dimension(:), intent(in) :: x
        integer(i8), dimension(:), allocatable :: init
        if (size(x) > 1) then
            allocate(init(size(x) - 1))
            init = x(:size(x) - 1)
        else
            allocate(init(0))
        end if
    end function init_i8

    !===== REAL =====
    pure function init_r4(x) result(init)
        !! This specific procedure is for 4-byte reals.
        real(r4), dimension(:), intent(in) :: x
        real(r4), dimension(:), allocatable :: init
        if (size(x) > 1) then
            allocate(init(size(x) - 1))
            init = x(:size(x) - 1)
        else
            allocate(init(0))
        end if
    end function init_r4

    pure function init_r8(x) result(init)
        !! This specific procedure is for 8-byte reals.
        real(r8), dimension(:), intent(in) :: x
        real(r8), dimension(:), allocatable :: init
        if (size(x) > 1) then
            allocate(init(size(x) - 1))
            init = x(:size(x) - 1)
        else
            allocate(init(0))
        end if
    end function init_r8

    pure function init_r16(x) result(init)
        !! This specific procedure is for 16-byte reals.
        real(r16), dimension(:), intent(in) :: x
        real(r16), dimension(:), allocatable :: init
        if (size(x) > 1) then
            allocate(init(size(x) - 1))
            init = x(:size(x) - 1)
        else
            allocate(init(0))
        end if
    end function init_r16

    !===== COMPLEX =====
    pure function init_c4(x) result(init)
        !! This specific procedure is for 4-byte complex.
        complex(r4), dimension(:), intent(in) :: x
        complex(r4), dimension(:), allocatable :: init
        if (size(x) > 1) then
            allocate(init(size(x) - 1))
            init = x(:size(x) - 1)
        else
            allocate(init(0))
        end if
    end function init_c4

    pure function init_c8(x) result(init)
        !! This specific procedure is for 8-byte complex.
        complex(r8), dimension(:), intent(in) :: x
        complex(r8), dimension(:), allocatable :: init
        if (size(x) > 1) then
            allocate(init(size(x) - 1))
            init = x(:size(x) - 1)
        else
            allocate(init(0))
        end if
    end function init_c8

    pure function init_c16(x) result(init)
        !! This specific procedure is for 16-byte complex.
        complex(r16), dimension(:), intent(in) :: x
        complex(r16), dimension(:), allocatable :: init
        if (size(x) > 1) then
            allocate(init(size(x) - 1))
            init = x(:size(x) - 1)
        else
            allocate(init(0))
        end if
    end function init_c16

    !===== CHARACTER =====
    pure function init_char(x) result(init)
        !! This specific procedure is for character string.
        character(len=*), intent(in) :: x
        character(len=len(x) - 1) :: init
        if (len(x) > 1) then
            init = x(:len(x) - 1)
        else
            init = ''
        end if
    end function init_char

    !===== OPERATOR FOR EACH TYPE =====
    pure function op_init_i1(x)
        integer(i1), dimension(:), intent(in) :: x
        integer(i1), allocatable, dimension(:) :: op_init_i1
        op_init_i1 = init(x)
    end function op_init_i1

    pure function op_init_i2(x)
        integer(i2), dimension(:), intent(in) :: x
        integer(i2), allocatable, dimension(:) :: op_init_i2
        op_init_i2 = init(x)
    end function op_init_i2

    pure function op_init_i4(x)
        integer(i4), dimension(:), intent(in) :: x
        integer(i4), allocatable, dimension(:) :: op_init_i4
        op_init_i4 = init(x)
    end function op_init_i4

    pure function op_init_i8(x)
        integer(i8), dimension(:), intent(in) :: x
        integer(i8), allocatable, dimension(:) :: op_init_i8
        op_init_i8 = init(x)
    end function op_init_i8

    pure function op_init_r4(x)
        real(r4), dimension(:), intent(in) :: x
        real(r4), allocatable, dimension(:) :: op_init_r4
        op_init_r4 = init(x)
    end function op_init_r4

    pure function op_init_r8(x)
        real(r8), dimension(:), intent(in) :: x
        real(r8), allocatable, dimension(:) :: op_init_r8
        op_init_r8 = init(x)
    end function op_init_r8

    pure function op_init_r16(x)
        real(r16), dimension(:), intent(in) :: x
        real(r16), allocatable, dimension(:) :: op_init_r16
        op_init_r16 = init(x)
    end function op_init_r16

    pure function op_init_c4(x)
        complex(r4), dimension(:), intent(in) :: x
        complex(r4), allocatable, dimension(:) :: op_init_c4
        op_init_c4 = init(x)
    end function op_init_c4

    pure function op_init_c8(x)
        complex(r8), dimension(:), intent(in) :: x
        complex(r8), allocatable, dimension(:) :: op_init_c8
        op_init_c8 = init(x)
    end function op_init_c8

    pure function op_init_c16(x)
        complex(r16), dimension(:), intent(in) :: x
        complex(r16), allocatable, dimension(:) :: op_init_c16
        op_init_c16 = init(x)
    end function op_init_c16

    pure function op_init_char(x)
        character(len=*), intent(in) :: x
        character(len=len(x) - 1) :: op_init_char
        op_init_char = init(x)
    end function op_init_char

end module mod_init
