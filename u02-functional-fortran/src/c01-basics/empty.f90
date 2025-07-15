module mod_empty
    use iso_fortran_env, only : r4 => real32, r8 => real64, r16 => real128
    implicit none

contains

    pure function empty_i1(a) result(empty)
        !! Returns an allocated array of length `0`,
        !! and type and kind same as that of scalar `a`.
        !! This specific procedure is for 1-byte integers.
        !! Overloaded by generic procedure `empty`.
        integer(i1), intent(in) :: a !! Input scalar
        integer(i1), dimension(:), allocatable :: empty
        allocate(empty(0))
    end function empty_i1


    pure function empty_i2(a) result(empty)
        !! Returns an allocated array of length `0`,
        !! and type and kind same as that of scalar `a`.
        !! This specific procedure is for 2-byte integers.
        !! Overloaded by generic procedure `empty`.
        integer(i2), intent(in) :: a !! Input scalar
        integer(i2), dimension(:), allocatable :: empty
        allocate(empty(0))
    end function empty_i2


    pure function empty_i4(a) result(empty)
        !! Returns an allocated array of length `0`,
        !! and type and kind same as that of scalar `a`.
        !! This specific procedure is for 4-byte integers.
        !! Overloaded by generic procedure `empty`.
        integer(i4), intent(in) :: a !! Input scalar
        integer(i4), dimension(:), allocatable :: empty
        allocate(empty(0))
    end function empty_i4


    pure function empty_i8(a) result(empty)
        !! Returns an allocated array of length `0`,
        !! and type and kind same as that of scalar `a`.
        !! This specific procedure is for 8-byte integers.
        !! Overloaded by generic procedure `empty`.
        integer(i8), intent(in) :: a !! Input scalar
        integer(i8), dimension(:), allocatable :: empty
        allocate(empty(0))
    end function empty_i8


    pure function empty_r4(a) result(empty)
        !! Returns an allocated array of length `0`,
        !! and type and kind same as that of scalar `a`.
        !! This specific procedure is for 4-byte reals.
        !! Overloaded by generic procedure `empty`.
        real(r4), intent(in) :: a !! Input scalar
        real(r4), dimension(:), allocatable :: empty
        allocate(empty(0))
    end function empty_r4


    pure function empty_r8(a) result(empty)
        !! Returns an allocated array of length `0`,
        !! and type and kind same as that of scalar `a`.
        !! This specific procedure is for 8-byte reals.
        !! Overloaded by generic procedure `empty`.
        real(r8), intent(in) :: a !! Input scalar
        real(r8), dimension(:), allocatable :: empty
        allocate(empty(0))
    end function empty_r8


    pure function empty_r16(a) result(empty)
        !! Returns an allocated array of length `0`,
        !! and type and kind same as that of scalar `a`.
        !! This specific procedure is for 16-byte reals.
        !! Overloaded by generic procedure `empty`.
        real(r16), intent(in) :: a !! Input scalar
        real(r16), dimension(:), allocatable :: empty
        allocate(empty(0))
    end function empty_r16


    pure function empty_c4(a) result(empty)
        !! Returns an allocated array of length `0`,
        !! and type and kind same as that of scalar `a`.
        !! This specific procedure is for 4-byte complex reals.
        !! Overloaded by generic procedure `empty`.
        complex(r4), intent(in) :: a !! Input scalar
        complex(r4), dimension(:), allocatable :: empty
        allocate(empty(0))
    end function empty_c4


    pure function empty_c8(a) result(empty)
        !! Returns an allocated array of length `0`,
        !! and type and kind same as that of scalar `a`.
        !! This specific procedure is for 8-byte complex reals.
        !! Overloaded by generic procedure `empty`.
        complex(r8), intent(in) :: a !! Input scalar
        complex(r8), dimension(:), allocatable :: empty
        allocate(empty(0))
    end function empty_c8


    pure function empty_c16(a) result(empty)
        !! Returns an allocated array of length `0`,
        !! and type and kind same as that of scalar `a`.
        !! This specific procedure is for 16-byte complex reals.
        !! Overloaded by generic procedure `empty`.
        complex(r16), intent(in) :: a !! Input scalar
        complex(r16), dimension(:), allocatable :: empty
        allocate(empty(0))
    end function empty_c16


    pure function empty_char(a) result(empty)
        !! Returns an allocated array of length `0`,
        !! and type and kind same as that of scalar `a`.
        !! This specific procedure is for len=1 character.
        !! Overloaded by generic procedure `empty`.
        character(len = 1), intent(in) :: a !! Input scalar
        character(len = 1), dimension(:), allocatable :: empty
        allocate(empty(0))
    end function empty_char

end module mod_empty