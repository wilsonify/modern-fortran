module mod_compare
    use iso_fortran_env, only : &
            i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
            r4 => real32, r8 => real64, r16 => real128
    implicit none
    private
    public :: ge, le, lex_lt, lex_gt, lex_ge, almost_equal

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

    interface almost_equal
        module procedure almost_equal_r4, almost_equal_r8, almost_equal_r16
        module procedure almost_equal_c4, almost_equal_c8, almost_equal_c16
    end interface
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

    ! Generic almost_equal for r4
    pure logical function almost_equal_r4(x, y, rtol, atol)
        real(r4), intent(in) :: x(:), y(:)
        real(r4), intent(in), optional :: rtol, atol
        real(r4), parameter :: default_rtol = 1.0e-5_r4
        real(r4), parameter :: default_atol = 1.0e-6_r4
        real(r4) :: rel_tol, abs_tol
        integer :: i

        rel_tol = merge(rtol, default_rtol, present(rtol))
        abs_tol = merge(atol, default_atol, present(atol))

        almost_equal_r4 = .true.
        do i = 1, size(x)
            if (abs(x(i) - y(i)) > abs_tol + rel_tol * abs(y(i))) then
                almost_equal_r4 = .false.
                exit
            end if
        end do
    end function

    ! Generic almost_equal for r8
    pure logical function almost_equal_r8(x, y, rtol, atol)
        real(r8), intent(in) :: x(:), y(:)
        real(r8), intent(in), optional :: rtol, atol
        real(r8), parameter :: default_rtol = 1.0e-12_r8
        real(r8), parameter :: default_atol = 1.0e-14_r8
        real(r8) :: rel_tol, abs_tol
        integer :: i

        rel_tol = merge(rtol, default_rtol, present(rtol))
        abs_tol = merge(atol, default_atol, present(atol))

        almost_equal_r8 = .true.
        do i = 1, size(x)
            if (abs(x(i) - y(i)) > abs_tol + rel_tol * abs(y(i))) then
                almost_equal_r8 = .false.
                exit
            end if
        end do
    end function

    ! Generic almost_equal for r16
    pure logical function almost_equal_r16(x, y, rtol, atol)
        real(r16), intent(in) :: x(:), y(:)
        real(r16), intent(in), optional :: rtol, atol
        real(r16), parameter :: default_rtol = 1.0e-30_r16
        real(r16), parameter :: default_atol = 1.0e-32_r16
        real(r16) :: rel_tol, abs_tol
        integer :: i

        rel_tol = merge(rtol, default_rtol, present(rtol))
        abs_tol = merge(atol, default_atol, present(atol))

        almost_equal_r16 = .true.
        do i = 1, size(x)
            if (abs(x(i) - y(i)) > abs_tol + rel_tol * abs(y(i))) then
                almost_equal_r16 = .false.
                exit
            end if
        end do
    end function

    ! Generic almost_equal for complex(r4)
    pure logical function almost_equal_c4(x, y, rtol, atol)
        complex(r4), intent(in) :: x(:), y(:)
        real(r4), intent(in), optional :: rtol, atol
        real(r4), parameter :: default_rtol = 1.0e-5_r4
        real(r4), parameter :: default_atol = 1.0e-6_r4
        real(r4) :: rel_tol, abs_tol
        integer :: i

        rel_tol = merge(rtol, default_rtol, present(rtol))
        abs_tol = merge(atol, default_atol, present(atol))

        almost_equal_c4 = .true.
        do i = 1, size(x)
            if (abs(x(i) - y(i)) > abs_tol + rel_tol * abs(y(i))) then
                almost_equal_c4 = .false.
                exit
            end if
        end do
    end function

    ! Generic almost_equal for complex(r8)
    pure logical function almost_equal_c8(x, y, rtol, atol)
        complex(r8), intent(in) :: x(:), y(:)
        real(r8), intent(in), optional :: rtol, atol
        real(r8), parameter :: default_rtol = 1.0e-12_r8
        real(r8), parameter :: default_atol = 1.0e-14_r8
        real(r8) :: rel_tol, abs_tol
        integer :: i

        rel_tol = merge(rtol, default_rtol, present(rtol))
        abs_tol = merge(atol, default_atol, present(atol))

        almost_equal_c8 = .true.
        do i = 1, size(x)
            if (abs(x(i) - y(i)) > abs_tol + rel_tol * abs(y(i))) then
                almost_equal_c8 = .false.
                exit
            end if
        end do
    end function

    ! Generic almost_equal for complex(r16)
    pure logical function almost_equal_c16(x, y, rtol, atol)
        complex(r16), intent(in) :: x(:), y(:)
        real(r16), intent(in), optional :: rtol, atol
        real(r16), parameter :: default_rtol = 1.0e-30_r16
        real(r16), parameter :: default_atol = 1.0e-32_r16
        real(r16) :: rel_tol, abs_tol
        integer :: i

        rel_tol = merge(rtol, default_rtol, present(rtol))
        abs_tol = merge(atol, default_atol, present(atol))

        almost_equal_c16 = .true.
        do i = 1, size(x)
            if (abs(x(i) - y(i)) > abs_tol + rel_tol * abs(y(i))) then
                almost_equal_c16 = .false.
                exit
            end if
        end do
    end function

end module mod_compare

