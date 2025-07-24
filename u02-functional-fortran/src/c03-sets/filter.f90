module mod_filter
    use iso_fortran_env, only : i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
            r4 => real32, r8 => real64, r16 => real128
    implicit none

    ! Abstract interfaces for all filtering function types
    abstract interface

        pure function f_i1_logical(x) result(res)
            integer, parameter :: i1 = selected_int_kind(2)
            integer, parameter :: i2 = selected_int_kind(4)
            integer, parameter :: i4 = selected_int_kind(9)
            integer, parameter :: i8 = selected_int_kind(18)
            integer, parameter :: r4 = selected_real_kind(6, 37)
            integer, parameter :: r8 = selected_real_kind(15, 307)
            integer, parameter :: r16 = selected_real_kind(33, 4931)

            integer(i1), intent(in) :: x
            logical :: res
        end function f_i1_logical
    end interface

    abstract interface
        pure function f_i2_logical(x) result(res)
            integer, parameter :: i1 = selected_int_kind(2)
            integer, parameter :: i2 = selected_int_kind(4)
            integer, parameter :: i4 = selected_int_kind(9)
            integer, parameter :: i8 = selected_int_kind(18)
            integer, parameter :: r4 = selected_real_kind(6, 37)
            integer, parameter :: r8 = selected_real_kind(15, 307)
            integer, parameter :: r16 = selected_real_kind(33, 4931)

            integer(i2), intent(in) :: x
            logical :: res
        end function f_i2_logical
    end interface

    abstract interface
        pure function f_i4_logical(x) result(res)
            integer, parameter :: i1 = selected_int_kind(2)
            integer, parameter :: i2 = selected_int_kind(4)
            integer, parameter :: i4 = selected_int_kind(9)
            integer, parameter :: i8 = selected_int_kind(18)
            integer, parameter :: r4 = selected_real_kind(6, 37)
            integer, parameter :: r8 = selected_real_kind(15, 307)
            integer, parameter :: r16 = selected_real_kind(33, 4931)

            integer(i4), intent(in) :: x
            logical :: res
        end function f_i4_logical
    end interface

    abstract interface
        pure function f_i8_logical(x) result(res)
            integer, parameter :: i1 = selected_int_kind(2)
            integer, parameter :: i2 = selected_int_kind(4)
            integer, parameter :: i4 = selected_int_kind(9)
            integer, parameter :: i8 = selected_int_kind(18)
            integer, parameter :: r4 = selected_real_kind(6, 37)
            integer, parameter :: r8 = selected_real_kind(15, 307)
            integer, parameter :: r16 = selected_real_kind(33, 4931)

            integer(i8), intent(in) :: x
            logical :: res
        end function f_i8_logical
    end interface

    abstract interface
        pure function f_r4_logical(x) result(res)
            integer, parameter :: i1 = selected_int_kind(2)
            integer, parameter :: i2 = selected_int_kind(4)
            integer, parameter :: i4 = selected_int_kind(9)
            integer, parameter :: i8 = selected_int_kind(18)
            integer, parameter :: r4 = selected_real_kind(6, 37)
            integer, parameter :: r8 = selected_real_kind(15, 307)
            integer, parameter :: r16 = selected_real_kind(33, 4931)

            real(r4), intent(in) :: x
            logical :: res
        end function f_r4_logical
    end interface

    abstract interface
        pure function f_r8_logical(x) result(res)
            integer, parameter :: i1 = selected_int_kind(2)
            integer, parameter :: i2 = selected_int_kind(4)
            integer, parameter :: i4 = selected_int_kind(9)
            integer, parameter :: i8 = selected_int_kind(18)
            integer, parameter :: r4 = selected_real_kind(6, 37)
            integer, parameter :: r8 = selected_real_kind(15, 307)
            integer, parameter :: r16 = selected_real_kind(33, 4931)

            real(r8), intent(in) :: x
            logical :: res
        end function f_r8_logical
    end interface

    abstract interface
        pure function f_r16_logical(x) result(res)
            integer, parameter :: i1 = selected_int_kind(2)
            integer, parameter :: i2 = selected_int_kind(4)
            integer, parameter :: i4 = selected_int_kind(9)
            integer, parameter :: i8 = selected_int_kind(18)
            integer, parameter :: r4 = selected_real_kind(6, 37)
            integer, parameter :: r8 = selected_real_kind(15, 307)
            integer, parameter :: r16 = selected_real_kind(33, 4931)

            real(r16), intent(in) :: x
            logical :: res
        end function f_r16_logical
    end interface

    abstract interface
        pure function f_c4_logical(x) result(res)
            integer, parameter :: i1 = selected_int_kind(2)
            integer, parameter :: i2 = selected_int_kind(4)
            integer, parameter :: i4 = selected_int_kind(9)
            integer, parameter :: i8 = selected_int_kind(18)
            integer, parameter :: r4 = selected_real_kind(6, 37)
            integer, parameter :: r8 = selected_real_kind(15, 307)
            integer, parameter :: r16 = selected_real_kind(33, 4931)

            complex(r4), intent(in) :: x
            logical :: res
        end function f_c4_logical
    end interface

    abstract interface
        pure function f_c8_logical(x) result(res)
            integer, parameter :: i1 = selected_int_kind(2)
            integer, parameter :: i2 = selected_int_kind(4)
            integer, parameter :: i4 = selected_int_kind(9)
            integer, parameter :: i8 = selected_int_kind(18)
            integer, parameter :: r4 = selected_real_kind(6, 37)
            integer, parameter :: r8 = selected_real_kind(15, 307)
            integer, parameter :: r16 = selected_real_kind(33, 4931)

            complex(r8), intent(in) :: x
            logical :: res
        end function f_c8_logical
    end interface

    abstract interface
        pure function f_c16_logical(x) result(res)
            integer, parameter :: i1 = selected_int_kind(2)
            integer, parameter :: i2 = selected_int_kind(4)
            integer, parameter :: i4 = selected_int_kind(9)
            integer, parameter :: i8 = selected_int_kind(18)
            integer, parameter :: r4 = selected_real_kind(6, 37)
            integer, parameter :: r8 = selected_real_kind(15, 307)
            integer, parameter :: r16 = selected_real_kind(33, 4931)

            complex(r16), intent(in) :: x
            logical :: res
        end function f_c16_logical
    end interface
contains
    pure function filter_i1(f, x) result(filter)
        !! Returns a subset of `x` for which `f(x) == .true.`
        !! This specific procedure is for 1-byte integers.
        !! Overloaded by generic procedure `filter`.
        procedure(f_i1_logical) :: f !! Filtering function
        integer(i1), intent(in) :: x(:) !! Input array
        integer(i1), allocatable :: filter(:)
        integer :: i
        filter = pack(x, [(f(x(i)), i = 1, size(x))])
    end function filter_i1


    pure function filter_i2(f, x) result(filter)
        !! Returns a subset of `x` for which `f(x) == .true.`
        !! This specific procedure is for 2-byte integers.
        !! Overloaded by generic procedure `filter`.
        procedure(f_i2_logical) :: f !! Filtering function
        integer(i2), intent(in) :: x(:) !! Input array
        integer(i2), allocatable :: filter(:)
        integer :: i
        filter = pack(x, [(f(x(i)), i = 1, size(x))])
    end function filter_i2


    pure function filter_i4(f, x) result(filter)
        !! Returns a subset of `x` for which `f(x) == .true.`
        !! This specific procedure is for 4-byte integers.
        !! Overloaded by generic procedure `filter`.
        procedure(f_i4_logical) :: f !! Filtering function
        integer(i4), intent(in) :: x(:) !! Input array
        integer(i4), allocatable :: filter(:)
        integer :: i
        filter = pack(x, [(f(x(i)), i = 1, size(x))])
    end function filter_i4


    pure function filter_i8(f, x) result(filter)
        !! Returns a subset of `x` for which `f(x) == .true.`
        !! This specific procedure is for 8-byte integers.
        !! Overloaded by generic procedure `filter`.
        procedure(f_i8_logical) :: f !! Filtering function
        integer(i8), intent(in) :: x(:) !! Input array
        integer(i8), allocatable :: filter(:)
        integer :: i
        filter = pack(x, [(f(x(i)), i = 1, size(x))])
    end function filter_i8


    pure function filter_r4(f, x) result(filter)
        !! Returns a subset of `x` for which `f(x) == .true.`
        !! This specific procedure is for 4-byte reals.
        !! Overloaded by generic procedure `filter`.
        procedure(f_r4_logical) :: f !! Filtering function
        real(r4), intent(in) :: x(:) !! Input array
        real(r4), allocatable :: filter(:)
        integer :: i
        filter = pack(x, [(f(x(i)), i = 1, size(x))])
    end function filter_r4


    pure function filter_r8(f, x) result(filter)
        !! Returns a subset of `x` for which `f(x) == .true.`
        !! This specific procedure is for 8-byte reals.
        !! Overloaded by generic procedure `filter`.
        procedure(f_r8_logical) :: f !! Filtering function
        real(r8), intent(in) :: x(:) !! Input array
        real(r8), allocatable :: filter(:)
        integer :: i
        filter = pack(x, [(f(x(i)), i = 1, size(x))])
    end function filter_r8


    pure function filter_r16(f, x) result(filter)
        !! Returns a subset of `x` for which `f(x) == .true.`
        !! This specific procedure is for 16-byte reals.
        !! Overloaded by generic procedure `filter`.
        procedure(f_r16_logical) :: f !! Filtering function
        real(r16), intent(in) :: x(:) !! Input array
        real(r16), allocatable :: filter(:)
        integer :: i
        filter = pack(x, [(f(x(i)), i = 1, size(x))])
    end function filter_r16


    pure function filter_c4(f, x) result(filter)
        !! Returns a subset of `x` for which `f(x) == .true.`
        !! This specific procedure is for 4-byte reals.
        !! Overloaded by generic procedure `filter`.
        procedure(f_c4_logical) :: f !! Filtering function
        complex(r4), intent(in) :: x(:) !! Input array
        complex(r4), allocatable :: filter(:)
        integer :: i
        filter = pack(x, [(f(x(i)), i = 1, size(x))])
    end function filter_c4


    pure function filter_c8(f, x) result(filter)
        !! Returns a subset of `x` for which `f(x) == .true.`
        !! This specific procedure is for 8-byte complex numbers.
        !! Overloaded by generic procedure `filter`.
        procedure(f_c8_logical) :: f !! Filtering function
        complex(r8), intent(in) :: x(:) !! Input array
        complex(r8), allocatable :: filter(:)
        integer :: i
        filter = pack(x, [(f(x(i)), i = 1, size(x))])
    end function filter_c8


    pure function filter_c16(f, x) result(filter)
        !! Returns a subset of `x` for which `f(x) == .true.`
        !! This specific procedure is for 16-byte complex numbers.
        !! Overloaded by generic procedure `filter`.
        procedure(f_c16_logical) :: f !! Filtering function
        complex(r16), intent(in) :: x(:) !! Input array
        complex(r16), allocatable :: filter(:)
        integer :: i
        filter = pack(x, [(f(x(i)), i = 1, size(x))])
    end function filter_c16

end module mod_filter
