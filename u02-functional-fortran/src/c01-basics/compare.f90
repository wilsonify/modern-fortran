module mod_compare
    use iso_fortran_env, only : r4 => real32, r8 => real64, r16 => real128
    implicit none
    private

    ! Interfaces for absolute-value-based comparisons
    interface ge
        module procedure ge_c4, ge_c8, ge_c16
    end interface ge

    interface le
        module procedure lt_c4, lt_c8, lt_c16
    end interface le

    ! Interfaces for lexicographical comparisons
    interface lex_lt
        module procedure lt_lex_c4, lt_lex_c8, lt_lex_c16
    end interface lex_lt

    interface lex_gt
        module procedure gt_lex_c4, gt_lex_c8, gt_lex_c16
    end interface lex_gt

    interface lex_ge
        module procedure ge_lex_c4, ge_lex_c8, ge_lex_c16
    end interface lex_ge

    public :: ge, le, lex_lt, lex_gt, lex_ge

contains

    ! === ABSOLUTE VALUE COMPARISONS ===

    pure elemental logical function ge_c4(lhs, rhs) result(res)
        complex(r4), intent(in) :: lhs, rhs
        res = abs(lhs) >= abs(rhs)
    end function ge_c4

    pure elemental logical function ge_c8(lhs, rhs) result(res)
        complex(r8), intent(in) :: lhs, rhs
        res = abs(lhs) >= abs(rhs)
    end function ge_c8

    pure elemental logical function ge_c16(lhs, rhs) result(res)
        complex(r16), intent(in) :: lhs, rhs
        res = abs(lhs) >= abs(rhs)
    end function ge_c16

    pure elemental logical function lt_c4(lhs, rhs) result(res)
        complex(r4), intent(in) :: lhs, rhs
        res = abs(lhs) < abs(rhs)
    end function lt_c4

    pure elemental logical function lt_c8(lhs, rhs) result(res)
        complex(r8), intent(in) :: lhs, rhs
        res = abs(lhs) < abs(rhs)
    end function lt_c8

    pure elemental logical function lt_c16(lhs, rhs) result(res)
        complex(r16), intent(in) :: lhs, rhs
        res = abs(lhs) < abs(rhs)
    end function lt_c16

    ! === LEXICOGRAPHICAL COMPARISONS ===

    pure elemental logical function lt_lex_c4(lhs, rhs) result(res)
        complex(r4), intent(in) :: lhs, rhs
        res = (real(lhs) < real(rhs)) .or. &
              ((real(lhs) == real(rhs)) .and. (aimag(lhs) < aimag(rhs)))
    end function lt_lex_c4

    pure elemental logical function lt_lex_c8(lhs, rhs) result(res)
        complex(r8), intent(in) :: lhs, rhs
        res = (real(lhs) < real(rhs)) .or. &
              ((real(lhs) == real(rhs)) .and. (aimag(lhs) < aimag(rhs)))
    end function lt_lex_c8

    pure elemental logical function lt_lex_c16(lhs, rhs) result(res)
        complex(r16), intent(in) :: lhs, rhs
        res = (real(lhs) < real(rhs)) .or. &
              ((real(lhs) == real(rhs)) .and. (aimag(lhs) < aimag(rhs)))
    end function lt_lex_c16

    pure elemental logical function gt_lex_c4(lhs, rhs) result(res)
        complex(r4), intent(in) :: lhs, rhs
        res = (real(lhs) > real(rhs)) .or. &
              ((real(lhs) == real(rhs)) .and. (aimag(lhs) > aimag(rhs)))
    end function gt_lex_c4

    pure elemental logical function gt_lex_c8(lhs, rhs) result(res)
        complex(r8), intent(in) :: lhs, rhs
        res = (real(lhs) > real(rhs)) .or. &
              ((real(lhs) == real(rhs)) .and. (aimag(lhs) > aimag(rhs)))
    end function gt_lex_c8

    pure elemental logical function gt_lex_c16(lhs, rhs) result(res)
        complex(r16), intent(in) :: lhs, rhs
        res = (real(lhs) > real(rhs)) .or. &
              ((real(lhs) == real(rhs)) .and. (aimag(lhs) > aimag(rhs)))
    end function gt_lex_c16

    pure elemental logical function ge_lex_c4(lhs, rhs) result(res)
        complex(r4), intent(in) :: lhs, rhs
        res = (real(lhs) > real(rhs)) .or. &
              ((real(lhs) == real(rhs)) .and. (aimag(lhs) >= aimag(rhs)))
    end function ge_lex_c4

    pure elemental logical function ge_lex_c8(lhs, rhs) result(res)
        complex(r8), intent(in) :: lhs, rhs
        res = (real(lhs) > real(rhs)) .or. &
              ((real(lhs) == real(rhs)) .and. (aimag(lhs) >= aimag(rhs)))
    end function ge_lex_c8

    pure elemental logical function ge_lex_c16(lhs, rhs) result(res)
        complex(r16), intent(in) :: lhs, rhs
        res = (real(lhs) > real(rhs)) .or. &
              ((real(lhs) == real(rhs)) .and. (aimag(lhs) >= aimag(rhs)))
    end function ge_lex_c16

end module mod_compare
