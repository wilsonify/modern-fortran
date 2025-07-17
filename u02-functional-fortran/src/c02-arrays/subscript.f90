module mod_subscript
    use iso_fortran_env, only: i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
                               r4 => real32, r8 => real64, r16 => real128
contains

    pure function subscript_i1(x, ind) result(subscript)
        !! Subscripts the array `x` along indices `ind`.
        !! This specific procedure is for 1-byte integers.
        !! Overloaded by generic procedure `subscript`.
        integer(i1), dimension(:), intent(in) :: x !! Input array
        integer(i1), dimension(:), intent(in) :: ind !! Indices to subscript
        integer(i1), dimension(:), allocatable :: subscript
        integer(i1), dimension(:), allocatable :: indices
        integer :: i
        indices = pack(ind, ind > 0 .and. ind < size(x))
        allocate(subscript(size(indices)))
        do concurrent(i = 1:size(indices))
            subscript(i) = x(indices(i))
        enddo
    end function subscript_i1


    pure function subscript_i2(x, ind) result(subscript)
        !! Subscripts the array `x` along indices `ind`.
        !! This specific procedure is for 2-byte integers.
        !! Overloaded by generic procedure `subscript`.
        integer(i2), dimension(:), intent(in) :: x !! Input array
        integer(i2), dimension(:), intent(in) :: ind !! Indices to subscript
        integer(i2), dimension(:), allocatable :: subscript
        integer(i2), dimension(:), allocatable :: indices
        integer :: i
        indices = pack(ind, ind > 0 .and. ind < size(x))
        allocate(subscript(size(indices)))
        do concurrent(i = 1:size(indices))
            subscript(i) = x(indices(i))
        enddo
    end function subscript_i2


    pure function subscript_i4(x, ind) result(subscript)
        !! Subscripts the array `x` along indices `ind`.
        !! This specific procedure is for 4-byte integers.
        !! Overloaded by generic procedure `subscript`.
        integer(i4), dimension(:), intent(in) :: x !! Input array
        integer(i4), dimension(:), intent(in) :: ind !! Indices to subscript
        integer(i4), dimension(:), allocatable :: subscript
        integer(i4), dimension(:), allocatable :: indices
        integer :: i
        indices = pack(ind, ind > 0 .and. ind < size(x))
        allocate(subscript(size(indices)))
        do concurrent(i = 1:size(indices))
            subscript(i) = x(indices(i))
        enddo
    end function subscript_i4


    pure function subscript_i8(x, ind) result(subscript)
        !! Subscripts the array `x` along indices `ind`.
        !! This specific procedure is for 8-byte integers.
        !! Overloaded by generic procedure `subscript`.
        integer(i8), dimension(:), intent(in) :: x !! Input array
        integer(i8), dimension(:), intent(in) :: ind !! Indices to subscript
        integer(i8), dimension(:), allocatable :: subscript
        integer(i8), dimension(:), allocatable :: indices
        integer :: i
        indices = pack(ind, ind > 0 .and. ind < size(x))
        allocate(subscript(size(indices)))
        do concurrent(i = 1:size(indices))
            subscript(i) = x(indices(i))
        enddo
    end function subscript_i8


    pure function subscript_r4(x, ind) result(subscript)
        !! Subscripts the array `x` along indices `ind`.
        !! This specific procedure is for 4-byte reals.
        !! Overloaded by generic procedure `subscript`.
        real(r4), dimension(:), intent(in) :: x !! Input array
        integer(i4), dimension(:), intent(in) :: ind !! Indices to subscript
        real(r4), dimension(:), allocatable :: subscript
        integer(i4), dimension(:), allocatable :: indices
        integer :: i
        indices = pack(ind, ind > 0 .and. ind < size(x))
        allocate(subscript(size(indices)))
        do concurrent(i = 1:size(indices))
            subscript(i) = x(indices(i))
        enddo
    end function subscript_r4


    pure function subscript_r8(x, ind) result(subscript)
        !! Subscripts the array `x` along indices `ind`.
        !! This specific procedure is for 8-byte reals.
        !! Overloaded by generic procedure `subscript`.
        real(r8), dimension(:), intent(in) :: x !! Input array
        integer(i4), dimension(:), intent(in) :: ind !! Indices to subscript
        real(r8), dimension(:), allocatable :: subscript
        integer(i4), dimension(:), allocatable :: indices
        integer :: i
        indices = pack(ind, ind > 0 .and. ind < size(x))
        allocate(subscript(size(indices)))
        do concurrent(i = 1:size(indices))
            subscript(i) = x(indices(i))
        enddo
    end function subscript_r8


    pure function subscript_r16(x, ind) result(subscript)
        !! Subscripts the array `x` along indices `ind`.
        !! This specific procedure is for 16-byte reals.
        !! Overloaded by generic procedure `subscript`.
        real(r16), dimension(:), intent(in) :: x !! Input array
        integer(i4), dimension(:), intent(in) :: ind !! Indices to subscript
        real(r16), dimension(:), allocatable :: subscript
        integer(i4), dimension(:), allocatable :: indices
        integer :: i
        indices = pack(ind, ind > 0 .and. ind < size(x))
        allocate(subscript(size(indices)))
        do concurrent(i = 1:size(indices))
            subscript(i) = x(indices(i))
        enddo
    end function subscript_r16


    pure function subscript_c4(x, ind) result(subscript)
        !! Subscripts the array `x` along indices `ind`.
        !! This specific procedure is for 4-byte complex reals.
        !! Overloaded by generic procedure `subscript`.
        complex(r4), dimension(:), intent(in) :: x !! Input array
        integer(i4), dimension(:), intent(in) :: ind !! Indices to subscript
        complex(r4), dimension(:), allocatable :: subscript
        integer(i4), dimension(:), allocatable :: indices
        integer :: i
        indices = pack(ind, ind > 0 .and. ind < size(x))
        allocate(subscript(size(indices)))
        do concurrent(i = 1:size(indices))
            subscript(i) = x(indices(i))
        enddo
    end function subscript_c4


    pure function subscript_c8(x, ind) result(subscript)
        !! Subscripts the array `x` along indices `ind`.
        !! This specific procedure is for 8-byte complex reals.
        !! Overloaded by generic procedure `subscript`.
        complex(r8), dimension(:), intent(in) :: x !! Input array
        integer(i4), dimension(:), intent(in) :: ind !! Indices to subscript
        complex(r8), dimension(:), allocatable :: subscript
        integer(i4), dimension(:), allocatable :: indices
        integer :: i
        indices = pack(ind, ind > 0 .and. ind < size(x))
        allocate(subscript(size(indices)))
        do concurrent(i = 1:size(indices))
            subscript(i) = x(indices(i))
        enddo
    end function subscript_c8


    pure function subscript_c16(x, ind) result(subscript)
        !! Subscripts the array `x` along indices `ind`.
        !! This specific procedure is for 16-byte complex reals.
        !! Overloaded by generic procedure `subscript`.
        complex(r16), dimension(:), intent(in) :: x !! Input array
        integer(i4), dimension(:), intent(in) :: ind !! Indices to subscript
        complex(r16), dimension(:), allocatable :: subscript
        integer(i4), dimension(:), allocatable :: indices
        integer :: i
        indices = pack(ind, ind > 0 .and. ind < size(x))
        allocate(subscript(size(indices)))
        do concurrent(i = 1:size(indices))
            subscript(i) = x(indices(i))
        enddo
    end function subscript_c16

end module mod_subscript