module mod_sort
    use iso_fortran_env, only : i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
            r4 => real32, r8 => real64, r16 => real128
    use mod_compare
    use mod_str
    use mod_split
    use mod_head
    use mod_tail

    public :: sort

    interface sort
        module procedure sort_i1, sort_i2, sort_i4, sort_i8, &
                sort_r4, sort_r8, sort_r16, &
                sort_c4, sort_c8, sort_c16, &
                sort_char
    end interface sort


contains

    pure recursive function sort_i1(x) result(res)
        !! Recursive quicksort using binary tree pivot.
        !! This specific procedure is for 1-byte integers.
        !! Overloaded by generic procedure `sort`.
        integer(i1), dimension(:), intent(in) :: x !! Input array
        integer(i1), dimension(size(x)) :: res
        integer(i1), dimension(size(x) - 1) :: rest
        integer(i1) :: pivot
        if(size(x) > 1)then
            pivot = head(split(x, 2))
            rest = [split(x, 1), tail(split(x, 2))]
            res = [sort(pack(rest, rest < pivot)), pivot, &
                    sort(pack(rest, rest >= pivot))]
        else
            res = x
        endif
    end function sort_i1


    pure recursive function sort_i2(x) result(res)
        !! Recursive quicksort using binary tree pivot.
        !! using binary search tree pivot.
        !! This specific procedure is for 2-byte integers.
        !! Overloaded by generic procedure `sort`.
        integer(i2), dimension(:), intent(in) :: x !! Input array
        integer(i2), dimension(size(x)) :: res
        integer(i2), dimension(size(x) - 1) :: rest
        integer(i2) :: pivot
        if(size(x) > 1)then
            pivot = head(split(x, 2))
            rest = [split(x, 1), tail(split(x, 2))]
            res = [sort(pack(rest, rest < pivot)), pivot, &
                    sort(pack(rest, rest >= pivot))]
        else
            res = x
        endif
    end function sort_i2


    pure recursive function sort_i4(x) result(res)
        !! Recursive quicksort using binary tree pivot.
        !! This specific procedure is for 4-byte integers.
        !! Overloaded by generic procedure `sort`.
        integer(i4), dimension(:), intent(in) :: x !! Input array
        integer(i4), dimension(size(x)) :: res
        integer(i4), dimension(size(x) - 1) :: rest
        integer(i4) :: pivot
        if(size(x) > 1)then
            pivot = head(split(x, 2))
            rest = [split(x, 1), tail(split(x, 2))]
            res = [sort(pack(rest, rest < pivot)), pivot, &
                    sort(pack(rest, rest >= pivot))]
        else
            res = x
        endif
    end function sort_i4


    pure recursive function sort_i8(x) result(res)
        !! Recursive quicksort using binary tree pivot.
        !! using binary search tree pivot.
        !! This specific procedure is for 1-byte integers.
        !! Overloaded by generic procedure `sort`.
        integer(i8), dimension(:), intent(in) :: x !! Input array
        integer(i8), dimension(size(x)) :: res
        integer(i8), dimension(size(x) - 1) :: rest
        integer(i8) :: pivot
        if(size(x) > 1)then
            pivot = head(split(x, 2))
            rest = [split(x, 1), tail(split(x, 2))]
            res = [sort(pack(rest, rest < pivot)), pivot, &
                    sort(pack(rest, rest >= pivot))]
        else
            res = x
        endif
    end function sort_i8


    pure recursive function sort_r4(x) result(res)
        !! Recursive quicksort using binary tree pivot.
        !! This specific procedure is for 4-byte reals.
        !! Overloaded by generic procedure `sort`.
        real(r4), dimension(:), intent(in) :: x !! Input array
        real(r4), dimension(size(x)) :: res
        real(r4), dimension(size(x) - 1) :: rest
        real(r4) :: pivot
        if(size(x) > 1)then
            pivot = head(split(x, 2))
            rest = [split(x, 1), tail(split(x, 2))]
            res = [sort(pack(rest, rest < pivot)), pivot, &
                    sort(pack(rest, rest >= pivot))]
        else
            res = x
        endif
    end function sort_r4


    pure recursive function sort_r8(x) result(res)
        !! Recursive quicksort using binary tree pivot.
        !! This specific procedure is for 8-byte reals.
        !! Overloaded by generic procedure `sort`.
        real(r8), dimension(:), intent(in) :: x !! Input array
        real(r8), dimension(size(x)) :: res
        real(r8), dimension(size(x) - 1) :: rest
        real(r8) :: pivot
        if(size(x) > 1)then
            pivot = head(split(x, 2))
            rest = [split(x, 1), tail(split(x, 2))]
            res = [sort(pack(rest, rest < pivot)), pivot, &
                    sort(pack(rest, rest >= pivot))]
        else
            res = x
        endif
    end function sort_r8


    pure recursive function sort_r16(x) result(res)
        !! Recursive quicksort using binary tree pivot.
        !! This specific procedure is for 16-byte reals.
        !! Overloaded by generic procedure `sort`.
        real(r16), dimension(:), intent(in) :: x !! Input array
        real(r16), dimension(size(x)) :: res
        real(r16), dimension(size(x) - 1) :: rest
        real(r16) :: pivot
        if(size(x) > 1)then
            pivot = head(split(x, 2))
            rest = [split(x, 1), tail(split(x, 2))]
            res = [sort(pack(rest, rest < pivot)), pivot, &
                    sort(pack(rest, rest >= pivot))]
        else
            res = x
        endif
    end function sort_r16


    pure recursive function sort_c4(x) result(res)
        !! Recursive quicksort using binary tree pivot.
        !! This specific procedure is for 4-byte complex reals.
        !! Overloaded by generic procedure `sort`.
        complex(r4), dimension(:), intent(in) :: x !! Input array
        complex(r4), dimension(size(x)) :: res
        complex(r4), dimension(size(x) - 1) :: rest
        complex(r4) :: pivot
        if(size(x) > 1)then
            pivot = head(split(x, 2))
            rest = [split(x, 1), tail(split(x, 2))]
            res = [sort(pack(rest, lex_lt(rest, pivot))), pivot, &
                    sort(pack(rest, lex_ge(rest, pivot)))]
        else
            res = x
        endif
    end function sort_c4


    pure recursive function sort_c8(x) result(res)
        !! Recursive quicksort using binary tree pivot.
        !! This specific procedure is for 8-byte complex reals.
        !! Overloaded by generic procedure `sort`.
        complex(r8), dimension(:), intent(in) :: x !! Input array
        complex(r8), dimension(size(x)) :: res
        complex(r8), dimension(size(x) - 1) :: rest
        complex(r8) :: pivot
        if(size(x) > 1)then
            pivot = head(split(x, 2))
            rest = [split(x, 1), tail(split(x, 2))]
            res = [sort(pack(rest, lex_lt(rest, pivot))), pivot, &
                    sort(pack(rest, lex_ge(rest, pivot)))]
        else
            res = x
        endif
    end function sort_c8


    pure recursive function sort_c16(x) result(res)
        !! Recursive quicksort using binary tree pivot.
        !! This specific procedure is for 16-byte complex reals.
        !! Overloaded by generic procedure `sort`.
        complex(r16), dimension(:), intent(in) :: x !! Input array
        complex(r16), dimension(size(x)) :: res
        complex(r16), dimension(size(x) - 1) :: rest
        complex(r16) :: pivot
        if(size(x) > 1)then
            pivot = head(split(x, 2))
            rest = [split(x, 1), tail(split(x, 2))]
            res = [sort(pack(rest, lex_lt(rest, pivot))), pivot, &
                    sort(pack(rest, lex_ge(rest, pivot)))]
        else
            res = x
        endif
    end function sort_c16


    pure function sort_char(x) result(res)
        !! Recursive quicksort using binary tree pivot.
        !! This specific procedure is for character strings.
        !! Overloaded by generic procedure `sort`.
        character(len = *), intent(in) :: x !! Input array
        character(len = len(x)) :: res
        res = chars_to_string(achar(sort(iachar(string_to_chars(x)))))
    end function sort_char
end module mod_sort