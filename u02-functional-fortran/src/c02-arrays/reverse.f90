!! Returns the array `x` in reverse order.
module mod_reverse
    use iso_fortran_env, only : i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
            r4 => real32, r8 => real64, r16 => real128
    use mod_str
    implicit none

    interface reverse
        module procedure reverse_i1, reverse_i2, reverse_i4, reverse_i8, &
                reverse_r4, reverse_r8, reverse_r16, &
                reverse_c4, reverse_c8, reverse_c16, &
                reverse_char, reverse_char_array
    end interface reverse

    interface operator(.reverse.)
        module procedure op_reverse_i1, op_reverse_i2, op_reverse_i4, op_reverse_i8, &
                op_reverse_r4, op_reverse_r8, op_reverse_r16, &
                op_reverse_c4, op_reverse_c8, op_reverse_c16, &
                op_reverse_char
    end interface operator(.reverse.)

contains
    pure function reverse_i1(x) result(reverse)
        !! This specific procedure is for 1-byte integers.
        integer(i1), dimension(:), intent(in) :: x !! Input array
        integer(i1), dimension(size(x)) :: reverse
        reverse = x(size(x):1:-1)
    end function reverse_i1


    pure function reverse_i2(x) result(reverse)
        !! This specific procedure is for 2-byte integers.
        integer(i2), dimension(:), intent(in) :: x !! Input array
        integer(i2), dimension(size(x)) :: reverse
        reverse = x(size(x):1:-1)
    end function reverse_i2


    pure function reverse_i4(x) result(reverse)
        !! This specific procedure is for 4-byte integers.
        integer(i4), dimension(:), intent(in) :: x !! Input array
        integer(i4), dimension(size(x)) :: reverse
        reverse = x(size(x):1:-1)
    end function reverse_i4


    pure function reverse_i8(x) result(reverse)
        !! This specific procedure is for 8-byte integers.
        integer(i8), dimension(:), intent(in) :: x !! Input array
        integer(i8), dimension(size(x)) :: reverse
        reverse = x(size(x):1:-1)
    end function reverse_i8


    pure function reverse_r4(x) result(reverse)
        !! This specific procedure is for 4-byte reals.
        real(r4), dimension(:), intent(in) :: x !! Input array
        real(r4), dimension(size(x)) :: reverse
        reverse = x(size(x):1:-1)
    end function reverse_r4


    pure function reverse_r8(x) result(reverse)
        !! This specific procedure is for 8-byte reals.
        real(r8), dimension(:), intent(in) :: x !! Input array
        real(r8), dimension(size(x)) :: reverse
        reverse = x(size(x):1:-1)
    end function reverse_r8


    pure function reverse_r16(x) result(reverse)
        !! This specific procedure is for 16-byte reals.
        real(r16), dimension(:), intent(in) :: x !! Input array
        real(r16), dimension(size(x)) :: reverse
        reverse = x(size(x):1:-1)
    end function reverse_r16


    pure function reverse_c4(x) result(reverse)
        !! This specific procedure is for 4-byte complex numbers.
        complex(r4), dimension(:), intent(in) :: x !! Input array
        complex(r4), dimension(size(x)) :: reverse
        reverse = x(size(x):1:-1)
    end function reverse_c4


    pure function reverse_c8(x) result(reverse)
        !! This specific procedure is for 8-byte complex.
        complex(r8), dimension(:), intent(in) :: x !! Input array
        complex(r8), dimension(size(x)) :: reverse
        reverse = x(size(x):1:-1)
    end function reverse_c8


    pure function reverse_c16(x) result(reverse)
        !! This specific procedure is for 16-byte complex.
        complex(r16), dimension(:), intent(in) :: x !! Input array
        complex(r16), dimension(size(x)) :: reverse
        reverse = x(size(x):1:-1)
    end function reverse_c16


    pure function reverse_char(x) result(res)
        !! This specific procedure is for character strings.
        character(len = *), intent(in) :: x
        character(len = len(x)) :: res
        character(len = 1), allocatable :: arr(:)

        if (len(x) == 0) then
            res = ''  ! Return empty string immediately
        else
            arr = string_to_chars(x)
            arr = reverse_char_array(arr)  ! Calls reverse_char_array
            res = chars_to_string(arr)
        end if
    end function reverse_char


    pure function reverse_char_array(x) result(res)
        ! This reverses arrays of characters
        character(len = 1), dimension(:), intent(in) :: x
        character(len = 1), allocatable :: res(:)

        if (size(x) == 0) then
            allocate(res(0))
        else
            allocate(res(size(x)))
            res = x(size(x):1:-1)
        end if
    end function reverse_char_array

    ! Operator overloads calling reverse_* functions

    pure function op_reverse_i1(x) result(res)
        integer(i1), dimension(:), intent(in) :: x
        integer(i1), dimension(size(x)) :: res
        res = reverse_i1(x)
    end function op_reverse_i1

    pure function op_reverse_i2(x) result(res)
        integer(i2), dimension(:), intent(in) :: x
        integer(i2), dimension(size(x)) :: res
        res = reverse_i2(x)
    end function op_reverse_i2

    pure function op_reverse_i4(x) result(res)
        integer(i4), dimension(:), intent(in) :: x
        integer(i4), dimension(size(x)) :: res
        res = reverse_i4(x)
    end function op_reverse_i4

    pure function op_reverse_i8(x) result(res)
        integer(i8), dimension(:), intent(in) :: x
        integer(i8), dimension(size(x)) :: res
        res = reverse_i8(x)
    end function op_reverse_i8

    pure function op_reverse_r4(x) result(res)
        real(r4), dimension(:), intent(in) :: x
        real(r4), dimension(size(x)) :: res
        res = reverse_r4(x)
    end function op_reverse_r4

    pure function op_reverse_r8(x) result(res)
        real(r8), dimension(:), intent(in) :: x
        real(r8), dimension(size(x)) :: res
        res = reverse_r8(x)
    end function op_reverse_r8

    pure function op_reverse_r16(x) result(res)
        real(r16), dimension(:), intent(in) :: x
        real(r16), dimension(size(x)) :: res
        res = reverse_r16(x)
    end function op_reverse_r16

    pure function op_reverse_c4(x) result(res)
        complex(r4), dimension(:), intent(in) :: x
        complex(r4), dimension(size(x)) :: res
        res = reverse_c4(x)
    end function op_reverse_c4

    pure function op_reverse_c8(x) result(res)
        complex(r8), dimension(:), intent(in) :: x
        complex(r8), dimension(size(x)) :: res
        res = reverse_c8(x)
    end function op_reverse_c8

    pure function op_reverse_c16(x) result(res)
        complex(r16), dimension(:), intent(in) :: x
        complex(r16), dimension(size(x)) :: res
        res = reverse_c16(x)
    end function op_reverse_c16

    pure function op_reverse_char(x) result(res)
        character(len = *), intent(in) :: x
        character(len = len(x)) :: res
        res = reverse_char(x)
    end function op_reverse_char

end module mod_reverse