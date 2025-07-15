module mod_compare
    use iso_fortran_env, only : r4 => real32, r8 => real64, r16 => real128
    implicit none
    private
    public :: ge_c4, ge_c8, ge_c16
    public :: lt_c4, lt_c8, lt_c16

contains


    pure elemental logical function ge_c4(lhs, rhs) result(res)
        !! Private `>=` implementation for 4-byte complex numbers.
        complex(r4), intent(in) :: lhs, rhs
        res = abs(lhs) >= abs(rhs)
    end function ge_c4


    pure elemental logical function ge_c8(lhs, rhs) result(res)
        !! Private `>=` implementation for 8-byte complex numbers.
        complex(r8), intent(in) :: lhs, rhs
        res = abs(lhs) >= abs(rhs)
    end function ge_c8


    pure elemental logical function ge_c16(lhs, rhs) result(res)
        !! Private `>=` implementation for 16-byte complex numbers.
        complex(r16), intent(in) :: lhs, rhs
        res = abs(lhs) >= abs(rhs)
    end function ge_c16


    pure elemental logical function lt_c4(lhs, rhs) result(res)
        !! Private `<` implementation for 4-byte complex numbers.
        complex(r4), intent(in) :: lhs, rhs
        res = abs(lhs) < abs(rhs)
    end function lt_c4


    pure elemental logical function lt_c8(lhs, rhs) result(res)
        !! Private `<` implementation for 8-byte complex numbers.
        complex(r8), intent(in) :: lhs, rhs
        res = abs(lhs) < abs(rhs)
    end function lt_c8


    pure elemental logical function lt_c16(lhs, rhs) result(res)
        !! Private `<` implementation for 16-byte complex numbers.
        complex(r16), intent(in) :: lhs, rhs
        res = abs(lhs) < abs(rhs)
    end function lt_c16
end module mod_compare
