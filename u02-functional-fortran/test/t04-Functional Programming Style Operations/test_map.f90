module mod_map_functions
    use iso_fortran_env, only : &
        i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
        r4 => real32, r8 => real64, r16 => real128
    implicit none
    private

    ! Public interfaces
    public :: xpowx_i1, xpowx_i2, xpowx_i4, xpowx_i8
    public :: xpowx_r4, xpowx_r8, xpowx_r16
    public :: xpowx_c4, xpowx_c8, xpowx_c16

contains

    pure function xpowx_i1(x) result(res)
        integer(i1), intent(in) :: x
        integer(i1) :: res
        res = x**x
    end function

    pure function xpowx_i2(x) result(res)
        integer(i2), intent(in) :: x
        integer(i2) :: res
        res = x**x
    end function

    pure function xpowx_i4(x) result(res)
        integer(i4), intent(in) :: x
        integer(i4) :: res
        res = x**x
    end function

    pure function xpowx_i8(x) result(res)
        integer(i8), intent(in) :: x
        integer(i8) :: res
        res = x**x
    end function

    pure function xpowx_r4(x) result(res)
        real(r4), intent(in) :: x
        real(r4) :: res
        res = x**x
    end function

    pure function xpowx_r8(x) result(res)
        real(r8), intent(in) :: x
        real(r8) :: res
        res = x**x
    end function

    pure function xpowx_r16(x) result(res)
        real(r16), intent(in) :: x
        real(r16) :: res
        res = x**x
    end function

    pure function xpowx_c4(x) result(res)
        complex(r4), intent(in) :: x
        complex(r4) :: res
        res = x**x
    end function

    pure function xpowx_c8(x) result(res)
        complex(r8), intent(in) :: x
        complex(r8) :: res
        res = x**x
    end function

    pure function xpowx_c16(x) result(res)
        complex(r16), intent(in) :: x
        complex(r16) :: res
        res = x**x
    end function

end module mod_map_functions

program test_map
    use iso_fortran_env, only : &
        i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
        r4 => real32, r8 => real64, r16 => real128, &
        compiler_version, compiler_options
    use testing, only : assert, initialize_tests, report_tests
    use functional
    use mod_map_functions
    use mod_compare, only: almost_equal

    implicit none

    logical, dimension(:), allocatable :: tests
    logical :: test_failed
    integer :: n, ntests

    complex(r4), dimension(:), allocatable :: c4, c4res
    complex(r8), dimension(:), allocatable :: c8
    complex(r16), dimension(:), allocatable :: c16

    character(len = 100) :: s_compiler_version
    logical :: compiler_has_O3
    logical :: c4rescheck

    n = 1
    ntests = 10
    call initialize_tests(tests, ntests)

    tests(n) = assert(all(map(xpowx_i1, [1_i1, 2_i1, 3_i1]) == [1_i1, 4_i1, 27_i1]), 'map, int8'); n = n + 1
    tests(n) = assert(all(map(xpowx_i2, [1_i2, 2_i2, 3_i2]) == [1_i2, 4_i2, 27_i2]), 'map, int16'); n = n + 1
    tests(n) = assert(all(map(xpowx_i4, [1_i4, 2_i4, 3_i4]) == [1_i4, 4_i4, 27_i4]), 'map, int32'); n = n + 1
    tests(n) = assert(all(map(xpowx_i8, [1_i8, 2_i8, 3_i8]) == [1_i8, 4_i8, 27_i8]), 'map, int64'); n = n + 1

    tests(n) = assert(almost_equal(map(xpowx_r4, [1._r4, 2._r4, 3._r4]), [1._r4, 4._r4, 27._r4]), 'map, real32'); n = n + 1
    tests(n) = assert(almost_equal(map(xpowx_r8, [1._r8, 2._r8, 3._r8]), [1._r8, 4._r8, 27._r8]), 'map, real64'); n = n + 1
    tests(n) = assert(almost_equal(map(xpowx_r16, [1._r16, 2._r16, 3._r16]), [1._r16, 4._r16, 27._r16]), 'map, real128'); n = n + 1

    ! complex tests
    c4 = [cmplx(1._r4, 0._r4, kind=r4), cmplx(2._r4, 0._r4, kind=r4), cmplx(3._r4, 0._r4, kind=r4)]
    c8 = [cmplx(1._r8, 0._r8, kind=r8), cmplx(2._r8, 0._r8, kind=r8), cmplx(3._r8, 0._r8, kind=r8)]
    c16 = [cmplx(1._r16, 0._r16, kind=r16), cmplx(2._r16, 0._r16, kind=r16), cmplx(3._r16, 0._r16, kind=r16)]

    ! handle compiler-specific quirk
    c4rescheck = all(map(xpowx_c4, c4) == c4**c4)
    s_compiler_version = compiler_version()
    compiler_has_O3 = index(compiler_options(), '-O3') /= 0

    if (s_compiler_version(1:3) == 'GCC' .and. s_compiler_version(13:14) == '10' .and. compiler_has_O3) then
        print *, 'Using special check for gfortran-10 -O3 for complex real32'
        c4res = map(xpowx_c4, c4)
        c4rescheck = all(c4res == c4**c4)  ! works correctly when assigned
    end if
    tests(n) = assert(c4rescheck, 'map, complex real32'); n = n + 1

    tests(n) = assert(all(map(xpowx_c8, c8) == c8**c8), 'map, complex real64'); n = n + 1
    tests(n) = assert(all(map(xpowx_c16, c16) == c16**c16), 'map, complex real128'); n = n + 1

    call report_tests(tests, test_failed)
    if (test_failed) stop 1
end program test_map


