module mod_split
    use iso_fortran_env, only : i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
            r4 => real32, r8 => real64, r16 => real128

    interface split
        module procedure split_i1, split_i2, split_i4, split_i8, split_r4, &
                split_r8, split_r16, split_c4, split_c8, split_c16, split_char
    end interface split

contains

    pure function split_i1(x, section) result(split)
        !! Returns the first half of the array `x` if `section == 1`,
        !! the second half of the array `x` if `section == 2`,
        !! and an empty array otherwise. If `size(x) == 1`,  `split(x, 1)`
        !! returns and empty array,  and `split(x, 2)` returns `x(1)`.
        !! This specific procedure is for 1-byte integers.
        !! Overloaded by generic procedure `split`.
        integer(i1), dimension(:), intent(in) :: x !! Input array
        integer(i4), intent(in) :: section !! Array section to return
        integer(i1), dimension(:), allocatable :: split
        if(section == 1)then
            split = x(1:size(x) / 2)
        elseif(section == 2)then
            split = x(size(x) / 2 + 1:)
        endif
    end function split_i1


    pure function split_i2(x, section) result(split)
        !! Returns the first half of the array `x` if `section == 1`,
        !! the second half of the array `x` if `section == 2`,
        !! and an empty array otherwise. If `size(x) == 1`,  `split(x, 1)`
        !! returns and empty array,  and `split(x, 2)` returns `x(1)`.
        !! This specific procedure is for 2-byte integers.
        !! Overloaded by generic procedure `split`.
        integer(i2), dimension(:), intent(in) :: x !! Input array
        integer(i4), intent(in) :: section !! Array section to return
        integer(i2), dimension(:), allocatable :: split
        if(section == 1)then
            split = x(1:size(x) / 2)
        elseif(section == 2)then
            split = x(size(x) / 2 + 1:)
        endif
    end function split_i2


    pure function split_i4(x, section) result(split)
        !! Returns the first half of the array `x` if `section == 1`,
        !! the second half of the array `x` if `section == 2`,
        !! and an empty array otherwise. If `size(x) == 1`,  `split(x, 1)`
        !! returns and empty array,  and `split(x, 2)` returns `x(1)`.
        !! This specific procedure is for 4-byte integers.
        !! Overloaded by generic procedure `split`.
        integer(i4), dimension(:), intent(in) :: x !! Input array
        integer(i4), intent(in) :: section !! Array section to return
        integer(i4), dimension(:), allocatable :: split
        if(section == 1)then
            split = x(1:size(x) / 2)
        elseif(section == 2)then
            split = x(size(x) / 2 + 1:)
        endif
    end function split_i4


    pure function split_i8(x, section) result(split)
        !! Returns the first half of the array `x` if `section == 1`,
        !! the second half of the array `x` if `section == 2`,
        !! and an empty array otherwise. If `size(x) == 1`,  `split(x, 1)`
        !! returns and empty array,  and `split(x, 2)` returns `x(1)`.
        !! This specific procedure is for 8-byte integers.
        !! Overloaded by generic procedure `split`.
        integer(i8), dimension(:), intent(in) :: x !! Input array
        integer(i4), intent(in) :: section !! Array section to return
        integer(i8), dimension(:), allocatable :: split
        if(section == 1)then
            split = x(1:size(x) / 2)
        elseif(section == 2)then
            split = x(size(x) / 2 + 1:)
        endif
    end function split_i8


    pure function split_r4(x, section) result(split)
        !! Returns the first half of the array `x` if `section == 1`,
        !! the second half of the array `x` if `section == 2`,
        !! and an empty array otherwise. If `size(x) == 1`,  `split(x, 1)`
        !! returns and empty array,  and `split(x, 2)` returns `x(1)`.
        !! This specific procedure is for 4-byte reals.
        !! Overloaded by generic procedure `split`.
        real(r4), dimension(:), intent(in) :: x !! Input array
        integer(i4), intent(in) :: section !! Array section to return
        real(r4), dimension(:), allocatable :: split
        if(section == 1)then
            split = x(1:size(x) / 2)
        elseif(section == 2)then
            split = x(size(x) / 2 + 1:)
        endif
    end function split_r4


    pure function split_r8(x, section) result(split)
        !! Returns the first half of the array `x` if `section == 1`,
        !! the second half of the array `x` if `section == 2`,
        !! and an empty array otherwise. If `size(x) == 1`,  `split(x, 1)`
        !! returns and empty array,  and `split(x, 2)` returns `x(1)`.
        !! This specific procedure is for 8-byte reals.
        !! Overloaded by generic procedure `split`.
        real(r8), dimension(:), intent(in) :: x !! Input array
        integer(i4), intent(in) :: section !! Array section to return
        real(r8), dimension(:), allocatable :: split
        if(section == 1)then
            split = x(1:size(x) / 2)
        elseif(section == 2)then
            split = x(size(x) / 2 + 1:)
        endif
    end function split_r8


    pure function split_r16(x, section) result(split)
        !! Returns the first half of the array `x` if `section == 1`,
        !! the second half of the array `x` if `section == 2`,
        !! and an empty array otherwise. If `size(x) == 1`,  `split(x, 1)`
        !! returns and empty array,  and `split(x, 2)` returns `x(1)`.
        !! This specific procedure is for 16-byte reals.
        !! Overloaded by generic procedure `split`.
        real(r16), dimension(:), intent(in) :: x !! Input array
        integer(i4), intent(in) :: section !! Array section to return
        real(r16), dimension(:), allocatable :: split
        if(section == 1)then
            split = x(1:size(x) / 2)
        elseif(section == 2)then
            split = x(size(x) / 2 + 1:)
        endif
    end function split_r16


    pure function split_c4(x, section) result(split)
        !! Returns the first half of the array `x` if `section == 1`,
        !! the second half of the array `x` if `section == 2`,
        !! and an empty array otherwise. If `size(x) == 1`,  `split(x, 1)`
        !! returns and empty array,  and `split(x, 2)` returns `x(1)`.
        !! This specific procedure is for 4-byte complex reals.
        !! Overloaded by generic procedure `split`.
        complex(r4), dimension(:), intent(in) :: x !! Input array
        integer(i4), intent(in) :: section !! Array section to return
        complex(r4), dimension(:), allocatable :: split
        if(section == 1)then
            split = x(1:size(x) / 2)
        elseif(section == 2)then
            split = x(size(x) / 2 + 1:)
        endif
    end function split_c4


    pure function split_c8(x, section) result(split)
        !! Returns the first half of the array `x` if `section == 1`,
        !! the second half of the array `x` if `section == 2`,
        !! and an empty array otherwise. If `size(x) == 1`,  `split(x, 1)`
        !! returns and empty array,  and `split(x, 2)` returns `x(1)`.
        !! This specific procedure is for 8-byte complex reals.
        !! Overloaded by generic procedure `split`.
        complex(r8), dimension(:), intent(in) :: x !! Input array
        integer(i4), intent(in) :: section !! Array section to return
        complex(r8), dimension(:), allocatable :: split
        if(section == 1)then
            split = x(1:size(x) / 2)
        elseif(section == 2)then
            split = x(size(x) / 2 + 1:)
        endif
    end function split_c8


    pure function split_c16(x, section) result(split)
        !! Returns the first half of the array `x` if `section == 1`,
        !! the second half of the array `x` if `section == 2`,
        !! and an empty array otherwise. If `size(x) == 1`,  `split(x, 1)`
        !! returns and empty array,  and `split(x, 2)` returns `x(1)`.
        !! This specific procedure is for 16-byte complex reals.
        !! Overloaded by generic procedure `split`.
        complex(r16), dimension(:), intent(in) :: x !! Input array
        integer(i4), intent(in) :: section !! Array section to return
        complex(r16), dimension(:), allocatable :: split
        if(section == 1)then
            split = x(1:size(x) / 2)
        elseif(section == 2)then
            split = x(size(x) / 2 + 1:)
        endif
    end function split_c16


    pure function split_char(x, section) result(split)
        !! Returns the first half of the character string `x`
        !! if `section == 1`, the second half of  `x` if `section == 2`,
        !! and an empty string otherwise. If `size(x) == 1`,  `split(x, 1)`
        !! returns and empty array,  and `split(x, 2)` returns `x(1)`.
        !! Overloaded by generic procedure `split`.
        character(len = *), intent(in) :: x !! Input array
        integer(i4), intent(in) :: section !! Array section to return
        character(len = :), allocatable :: split
        if (section == 1) then
            split = x(1:len(x) / 2)
        else if (section == 2) then
            split = x(len(x) / 2 + 1:)
        else
            split = ''
        end if
    end function split_char

end module mod_split