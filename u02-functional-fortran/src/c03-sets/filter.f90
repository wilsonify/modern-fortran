module mod_filter
    use iso_fortran_env, only : &
            i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
            r4 => real32, r8 => real64, r16 => real128
    implicit none

    ! Define complex kinds explicitly from real kinds
    integer, parameter :: c4 = kind((0.0_r4, 0.0_r4))
    integer, parameter :: c8 = kind((0.0_r8, 0.0_r8))
    integer, parameter :: c16 = kind((0.0_r16, 0.0_r16))

    private
    public :: filter


    ! Abstract interfaces for predicate functions (one per type)
    abstract interface
        pure logical function predicate_i1(x)
            import :: i1
            integer(i1), intent(in) :: x
        end function

        pure logical function predicate_i2(x)
            import :: i2
            integer(i2), intent(in) :: x
        end function

        pure logical function predicate_i4(x)
            import :: i4
            integer(i4), intent(in) :: x
        end function

        pure logical function predicate_i8(x)
            import :: i8
            integer(i8), intent(in) :: x
        end function

        pure logical function predicate_r4(x)
            import :: r4
            real(r4), intent(in) :: x
        end function

        pure logical function predicate_r8(x)
            import :: r8
            real(r8), intent(in) :: x
        end function

        pure logical function predicate_r16(x)
            import :: r16
            real(r16), intent(in) :: x
        end function

        pure logical function predicate_c4(x)
            import :: c4
            complex(c4), intent(in) :: x
        end function

        pure logical function predicate_c8(x)
            import :: c8
            complex(c8), intent(in) :: x
        end function

        pure logical function predicate_c16(x)
            import :: c16
            complex(c16), intent(in) :: x
        end function

        pure logical function predicate_char(x)
            character(*), intent(in) :: x
        end function
    end interface

    interface filter
        module procedure filter_i1
        module procedure filter_i2
        module procedure filter_i4
        module procedure filter_i8
        module procedure filter_r4
        module procedure filter_r8
        module procedure filter_r16
        module procedure filter_c4
        module procedure filter_c8
        module procedure filter_c16
        module procedure filter_char
    end interface


contains

    pure function filter_i1(pred, arr) result(filtered)
        integer(i1), intent(in) :: arr(:)
        procedure(predicate_i1) :: pred
        integer(i1), allocatable :: filtered(:)
        integer :: i, count
        filtered = pack(arr, [(pred(arr(i)), i = 1, size(arr))])
    end function filter_i1

    pure function filter_i2(pred, arr) result(filtered)
        integer(i2), intent(in) :: arr(:)
        procedure(predicate_i2) :: pred
        integer(i2), allocatable :: filtered(:)
        integer :: i, count
        filtered = pack(arr, [(pred(arr(i)), i = 1, size(arr))])
    end function filter_i2

    pure function filter_i4(pred, arr) result(filtered)
        integer(i4), intent(in) :: arr(:)
        procedure(predicate_i4) :: pred
        integer(i4), allocatable :: filtered(:)
        integer :: i, count
        filtered = pack(arr, [(pred(arr(i)), i = 1, size(arr))])
    end function filter_i4

    pure function filter_i8(pred, arr) result(filtered)
        integer(i8), intent(in) :: arr(:)
        procedure(predicate_i8) :: pred
        integer(i8), allocatable :: filtered(:)
        integer :: i, count
        filtered = pack(arr, [(pred(arr(i)), i = 1, size(arr))])
    end function filter_i8

    pure function filter_r4(pred, arr) result(filtered)
        real(r4), intent(in) :: arr(:)
        procedure(predicate_r4) :: pred
        real(r4), allocatable :: filtered(:)
        integer :: i, count
        filtered = pack(arr, [(pred(arr(i)), i = 1, size(arr))])
    end function filter_r4

    pure function filter_r8(pred, arr) result(filtered)
        real(r8), intent(in) :: arr(:)
        procedure(predicate_r8) :: pred
        real(r8), allocatable :: filtered(:)
        integer :: i, count
        filtered = pack(arr, [(pred(arr(i)), i = 1, size(arr))])
    end function filter_r8

    pure function filter_r16(pred, arr) result(filtered)
        real(r16), intent(in) :: arr(:)
        procedure(predicate_r16) :: pred
        real(r16), allocatable :: filtered(:)
        integer :: i, count
        filtered = pack(arr, [(pred(arr(i)), i = 1, size(arr))])
    end function filter_r16

    pure function filter_c4(pred, arr) result(filtered)
        complex(c4), intent(in) :: arr(:)
        procedure(predicate_c4) :: pred
        complex(c4), allocatable :: filtered(:)
        integer :: i, count
        filtered = pack(arr, [(pred(arr(i)), i = 1, size(arr))])
    end function filter_c4

    pure function filter_c8(pred, arr) result(filtered)
        complex(c8), intent(in) :: arr(:)
        procedure(predicate_c8) :: pred
        complex(c8), allocatable :: filtered(:)
        integer :: i, count
        filtered = pack(arr, [(pred(arr(i)), i = 1, size(arr))])
    end function filter_c8

    pure function filter_c16(pred, arr) result(filtered)
        complex(c16), intent(in) :: arr(:)
        procedure(predicate_c16) :: pred
        complex(c16), allocatable :: filtered(:)
        integer :: i, count
        filtered = pack(arr, [(pred(arr(i)), i = 1, size(arr))])
    end function filter_c16

    pure function filter_char(pred, arr) result(filtered)
        character(len = *), intent(in) :: arr(:)
        procedure(predicate_char) :: pred
        character(len = len(arr)), allocatable :: filtered(:)
        integer :: i, count
        filtered = pack(arr, [(pred(arr(i)), i = 1, size(arr))])
    end function filter_char

end module mod_filter
