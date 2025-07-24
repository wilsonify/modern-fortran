module mod_arange
    use iso_fortran_env, only : i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
            r4 => real32, r8 => real64, r16 => real128

    implicit none
    private

    public :: arange
    interface arange
        module procedure :: arange_i1, arange_i2, arange_i4, arange_i8, &
                arange_r4, arange_r8, arange_r16, &
                arange_c4, arange_c8, arange_c16
    end interface

contains


    pure function arange_i1(start, end, increment) result(arange)
        !! Returns an array of integers given `start`,  `end`,  and `increment` values.
        !! Increment defaults to 1 if not provided.
        !! This specific procedure is for 1-byte integers.
        !! Oveloaded by generic procedure `arange`.
        integer(i1), intent(in) :: start !! Start value of the array
        integer(i1), intent(in) :: end !! End value of the array
        integer(i1), intent(in), optional :: increment !! Array increment
        integer(i1), dimension(:), allocatable :: arange
        integer(i1) :: incr
        integer(i1) :: i
        integer(i1) :: length
        if(present(increment))then
            incr = increment
        else
            incr = 1
        endif
        length = (end - start) / incr + 1
        allocate(arange(length))
        do concurrent(i = 1:length)
            arange(i) = start + (i - 1) * incr
        enddo
    end function arange_i1


    pure function arange_i2(start, end, increment) result(arange)
        !! Returns an array of integers given `start`,  `end`,  and `increment` values.
        !! Increment defaults to 1 if not provided.
        !! This specific procedure is for 2-byte integers.
        !! Oveloaded by generic procedure `arange`.
        integer(i2), intent(in) :: start !! Start value of the array
        integer(i2), intent(in) :: end !! End value of the array
        integer(i2), intent(in), optional :: increment !! Array increment
        integer(i2), dimension(:), allocatable :: arange
        integer(i2) :: incr
        integer(i2) :: i
        integer(i2) :: length
        if(present(increment))then
            incr = increment
        else
            incr = 1
        endif
        length = (end - start) / incr + 1
        allocate(arange(length))
        do concurrent(i = 1:length)
            arange(i) = start + (i - 1) * incr
        enddo
    end function arange_i2


    pure function arange_i4(start, end, increment) result(arange)
        !! Returns an array of integers given `start`,  `end`,  and `increment` values.
        !! Increment defaults to 1 if not provided.
        !! This specific procedure is for 4-byte integers.
        !! Oveloaded by generic procedure `arange`.
        integer(i4), intent(in) :: start !! Start value of the array
        integer(i4), intent(in) :: end !! End value of the array
        integer(i4), intent(in), optional :: increment !! Array increment
        integer(i4), dimension(:), allocatable :: arange
        integer(i4) :: incr
        integer(i4) :: i
        integer(i4) :: length
        if(present(increment))then
            incr = increment
        else
            incr = 1
        endif
        length = (end - start) / incr + 1
        allocate(arange(length))
        do concurrent(i = 1:length)
            arange(i) = start + (i - 1) * incr
        enddo
    end function arange_i4


    pure function arange_i8(start, end, increment) result(arange)
        !! Returns an array of integers given `start`,  `end`,  and `increment` values.
        !! Increment defaults to 1 if not provided.
        !! This specific procedure is for 8-byte integers.
        !! Oveloaded by generic procedure `arange`.
        integer(i8), intent(in) :: start !! Start value of the array
        integer(i8), intent(in) :: end !! End value of the array
        integer(i8), intent(in), optional :: increment !! Array increment
        integer(i8), dimension(:), allocatable :: arange
        integer(i8) :: incr
        integer(i8) :: i
        integer(i8) :: length
        if(present(increment))then
            incr = increment
        else
            incr = 1
        endif
        length = (end - start) / incr + 1
        allocate(arange(length))
        do concurrent(i = 1:length)
            arange(i) = start + (i - 1) * incr
        enddo
    end function arange_i8


    pure function arange_r4(start, end, increment) result(arange)
        !! Returns an array of reals given `start`,  `end`,  and `increment` values.
        !! Increment defaults to 1 if not provided.
        !! This specific procedure is for 4-byte reals.
        !! Oveloaded by generic procedure `arange`.
        real(r4), intent(in) :: start !! Start value of the array
        real(r4), intent(in) :: end !! End value of the array
        real(r4), intent(in), optional :: increment !! Array increment
        real(r4), dimension(:), allocatable :: arange
        real(r4) :: incr
        integer(i4) :: i
        integer(i4) :: length
        if(present(increment))then
            incr = increment
        else
            incr = 1
        endif
        length = (end - start + 0.5 * incr) / incr + 1
        allocate(arange(length))
        do concurrent(i = 1:length)
            arange(i) = start + (i - 1) * incr
        enddo
    end function arange_r4


    pure function arange_r8(start, end, increment) result(arange)
        !! Returns an array of reals given `start`,  `end`,  and `increment` values.
        !! Increment defaults to 1 if not provided.
        !! This specific procedure is for 8-byte reals.
        !! Oveloaded by generic procedure `arange`.
        real(r8), intent(in) :: start !! Start value of the array
        real(r8), intent(in) :: end !! End value of the array
        real(r8), intent(in), optional :: increment !! Array increment
        real(r8), dimension(:), allocatable :: arange
        real(r8) :: incr
        integer(i4) :: i
        integer(i4) :: length
        if(present(increment))then
            incr = increment
        else
            incr = 1
        endif
        length = (end - start + 0.5 * incr) / incr + 1
        allocate(arange(length))
        do concurrent(i = 1:length)
            arange(i) = start + (i - 1) * incr
        enddo
    end function arange_r8


    pure function arange_r16(start, end, increment) result(arange)
        !! Returns an array of reals given `start`,  `end`,  and `increment` values.
        !! Increment defaults to 1 if not provided.
        !! This specific procedure is for 16-byte reals.
        !! Oveloaded by generic procedure `arange`.
        real(r16), intent(in) :: start !! Start value of the array
        real(r16), intent(in) :: end !! End value of the array
        real(r16), intent(in), optional :: increment !! Array increment
        real(r16), dimension(:), allocatable :: arange
        real(r16) :: incr
        integer(i4) :: i
        integer(i4) :: length
        if(present(increment))then
            incr = increment
        else
            incr = 1
        endif
        length = (end - start + 0.5 * incr) / incr + 1
        allocate(arange(length))
        do concurrent(i = 1:length)
            arange(i) = start + (i - 1) * incr
        enddo
    end function arange_r16


    pure function arange_c4(start, end, increment) result(arange)
        !! Returns an array of complex numbers given `start`,  `end`,  and
        !! `increment` values. Increment defaults to (1, 0) if not provided.
        !! Size of the resulting array is determined with real components of
        !! `start`,  `end`,  and  `increment` values if `real(increment) /= 0`,
        !! and imaginary components otherwise.
        !! This specific procedure is for 4-byte complex numbers.
        !! Oveloaded by generic procedure `arange`.
        complex(r4), intent(in) :: start !! Start value of the array
        complex(r4), intent(in) :: end !! End value of the array
        complex(r4), intent(in), optional :: increment !! Array increment
        complex(r4), dimension(:), allocatable :: arange
        complex(r4) :: incr
        integer(i4) :: i
        integer(i4) :: length
        if(present(increment))then
            incr = increment
        else
            incr = (1, 0)
        endif
        if(real(incr) /= 0)then
            length = (real(end) - real(start) + 0.5 * real(incr)) / real(incr) + 1
        else
            length = (aimag(end) - aimag(start) + 0.5 * aimag(incr)) / aimag(incr) + 1
        endif
        allocate(arange(length))
        do concurrent(i = 1:length)
            arange(i) = cmplx(real(start) + (i - 1) * real(incr), &
                    aimag(start) + (i - 1) * aimag(incr))
        enddo
    end function arange_c4


    pure function arange_c8(start, end, increment) result(arange)
        !! Returns an array of complex numbers given `start`,  `end`,  and
        !! `increment` values. Increment defaults to (1, 0) if not provided.
        !! Size of the resulting array is determined with real components of
        !! `start`,  `end`,  and  `increment` values if `real(increment) /= 0`,
        !! and imaginary components otherwise.
        !! This specific procedure is for 8-byte complex numbers.
        !! Oveloaded by generic procedure `arange`.
        complex(r8), intent(in) :: start !! Start value of the array
        complex(r8), intent(in) :: end !! End value of the array
        complex(r8), intent(in), optional :: increment !! Array increment
        complex(r8), dimension(:), allocatable :: arange
        complex(r8) :: incr
        integer(i4) :: i
        integer(i4) :: length
        if(present(increment))then
            incr = increment
        else
            incr = (1, 0)
        endif
        if(real(incr) /= 0)then
            length = (real(end) - real(start) + 0.5 * real(incr)) / real(incr) + 1
        else
            length = (aimag(end) - aimag(start) + 0.5 * aimag(incr)) / aimag(incr) + 1
        endif
        allocate(arange(length))
        do concurrent(i = 1:length)
            arange(i) = cmplx(real(start) + (i - 1) * real(incr), &
                    aimag(start) + (i - 1) * aimag(incr))
        enddo
    end function arange_c8


    pure function arange_c16(start, end, increment) result(arange)
        !! Returns an array of complex numbers given `start`,  `end`,  and
        !! `increment` values. Increment defaults to (1, 0) if not provided.
        !! Size of the resulting array is determined with real components of
        !! `start`,  `end`,  and  `increment` values if `real(increment) /= 0`,
        !! and imaginary components otherwise.
        !! This specific procedure is for 16-byte complex numbers.
        !! Oveloaded by generic procedure `arange`.
        complex(r16), intent(in) :: start !! Start value of the array
        complex(r16), intent(in) :: end !! End value of the array
        complex(r16), intent(in), optional :: increment !! Array increment
        complex(r16), dimension(:), allocatable :: arange
        complex(r16) :: incr
        integer(i4) :: i
        integer(i4) :: length
        if(present(increment))then
            incr = increment
        else
            incr = (1, 0)
        endif
        if(real(incr) /= 0)then
            length = (real(end) - real(start) + 0.5 * real(incr)) / real(incr) + 1
        else
            length = (aimag(end) - aimag(start) + 0.5 * aimag(incr)) / aimag(incr) + 1
        endif
        allocate(arange(length))
        do concurrent(i = 1:length)
            arange(i) = cmplx(real(start) + (i - 1) * real(incr), &
                    aimag(start) + (i - 1) * aimag(incr))
        enddo
    end function arange_c16


end module mod_arange