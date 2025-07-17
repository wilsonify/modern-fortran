module mod_insert
contains

    pure function insert_i1(elem, ind, x) result(insert)
        !! Inserts `elem` into index `ind` of array `x`.
        !! This specific procedure is for 1-byte integers.
        !! Overloaded by generic procedure `insert`.
        integer(i1), intent(in) :: elem !! Element to insert
        integer(i4), intent(in) :: ind !! Index to insert element at
        integer(i1), dimension(:), intent(in) :: x !! Input array
        integer(i1), dimension(size(x) + 1) :: insert
        insert = [x(:limit(ind, 1, size(x) + 1) - 1), elem, x(limit(ind, 1, size(x) + 1):)]
    end function insert_i1


    pure function insert_i2(elem, ind, x) result(insert)
        !! Inserts `elem` into index `ind` of array `x`.
        !! This specific procedure is for 2-byte integers.
        !! Overloaded by generic procedure `insert`.
        integer(i2), intent(in) :: elem !! Element to insert
        integer(i4), intent(in) :: ind !! Index to insert element at
        integer(i2), dimension(:), intent(in) :: x !! Input array
        integer(i2), dimension(size(x) + 1) :: insert
        insert = [x(:limit(ind, 1, size(x) + 1) - 1), elem, x(limit(ind, 1, size(x) + 1):)]
    end function insert_i2


    pure function insert_i4(elem, ind, x) result(insert)
        !! Inserts `elem` into index `ind` of array `x`.
        !! This specific procedure is for 4-byte integers.
        !! Overloaded by generic procedure `insert`.
        integer(i4), intent(in) :: elem !! Element to insert
        integer(i4), intent(in) :: ind !! Index to insert element at
        integer(i4), dimension(:), intent(in) :: x !! Input array
        integer(i4), dimension(size(x) + 1) :: insert
        insert = [x(:limit(ind, 1, size(x) + 1) - 1), elem, x(limit(ind, 1, size(x) + 1):)]
    end function insert_i4


    pure function insert_i8(elem, ind, x) result(insert)
        !! Inserts `elem` into index `ind` of array `x`.
        !! This specific procedure is for 8-byte integers.
        !! Overloaded by generic procedure `insert`.
        integer(i8), intent(in) :: elem !! Element to insert
        integer(i4), intent(in) :: ind !! Index to insert element at
        integer(i8), dimension(:), intent(in) :: x !! Input array
        integer(i8), dimension(size(x) + 1) :: insert
        insert = [x(:limit(ind, 1, size(x) + 1) - 1), elem, x(limit(ind, 1, size(x) + 1):)]
    end function insert_i8


    pure function insert_r4(elem, ind, x) result(insert)
        !! Inserts `elem` into index `ind` of array `x`.
        !! This specific procedure is for 4-byte reals.
        !! Overloaded by generic procedure `insert`.
        real(r4), intent(in) :: elem !! Element to insert
        integer(i4), intent(in) :: ind !! Index to insert element at
        real(r4), dimension(:), intent(in) :: x !! Input array
        real(r4), dimension(size(x) + 1) :: insert
        insert = [x(:limit(ind, 1, size(x) + 1) - 1), elem, x(limit(ind, 1, size(x) + 1):)]
    end function insert_r4


    pure function insert_r8(elem, ind, x) result(insert)
        !! Inserts `elem` into index `ind` of array `x`.
        !! This specific procedure is for 8-byte reals.
        !! Overloaded by generic procedure `insert`.
        real(r8), intent(in) :: elem !! Element to insert
        integer(i4), intent(in) :: ind !! Index to insert element at
        real(r8), dimension(:), intent(in) :: x !! Input array
        real(r8), dimension(size(x) + 1) :: insert
        insert = [x(:limit(ind, 1, size(x) + 1) - 1), elem, x(limit(ind, 1, size(x) + 1):)]
    end function insert_r8


    pure function insert_r16(elem, ind, x) result(insert)
        !! Inserts `elem` into index `ind` of array `x`.
        !! This specific procedure is for 16-byte reals.
        !! Overloaded by generic procedure `insert`.
        real(r16), intent(in) :: elem !! Element to insert
        integer(i4), intent(in) :: ind !! Index to insert element at
        real(r16), dimension(:), intent(in) :: x !! Input array
        real(r16), dimension(size(x) + 1) :: insert
        insert = [x(:limit(ind, 1, size(x) + 1) - 1), elem, x(limit(ind, 1, size(x) + 1):)]
    end function insert_r16


    pure function insert_c4(elem, ind, x) result(insert)
        !! Inserts `elem` into index `ind` of array `x`.
        !! This specific procedure is for 4-byte complex reals.
        !! Overloaded by generic procedure `insert`.
        complex(r4), intent(in) :: elem !! Element to insert
        integer(i4), intent(in) :: ind !! Index to insert element at
        complex(r4), dimension(:), intent(in) :: x !! Input array
        complex(r4), dimension(size(x) + 1) :: insert
        insert = [x(:limit(ind, 1, size(x) + 1) - 1), elem, x(limit(ind, 1, size(x) + 1):)]
    end function insert_c4


    pure function insert_c8(elem, ind, x) result(insert)
        !! Inserts `elem` into index `ind` of array `x`.
        !! This specific procedure is for 8-byte complex reals.
        !! Overloaded by generic procedure `insert`.
        complex(r8), intent(in) :: elem !! Element to insert
        integer(i4), intent(in) :: ind !! Index to insert element at
        complex(r8), dimension(:), intent(in) :: x !! Input array
        complex(r8), dimension(size(x) + 1) :: insert
        insert = [x(:limit(ind, 1, size(x) + 1) - 1), elem, x(limit(ind, 1, size(x) + 1):)]
    end function insert_c8


    pure function insert_c16(elem, ind, x) result(insert)
        !! Inserts `elem` into index `ind` of array `x`.
        !! This specific procedure is for 16-byte complex reals.
        !! Overloaded by generic procedure `insert`.
        complex(r16), intent(in) :: elem !! Element to insert
        integer(i4), intent(in) :: ind !! Index to insert element at
        complex(r16), dimension(:), intent(in) :: x !! Input array
        complex(r16), dimension(size(x) + 1) :: insert
        insert = [x(:limit(ind, 1, size(x) + 1) - 1), elem, x(limit(ind, 1, size(x) + 1):)]
    end function insert_c16


    pure function insert_char(elem, ind, x) result(insert)
        !! Inserts character string `elem` into
        !! index `ind` of character string `x`.
        !! Overloaded by generic procedure `insert`.
        character(len = *), intent(in) :: elem !! Character string to insert
        integer(i4), intent(in) :: ind !! Index to insert element at
        character(len = *), intent(in) :: x !! Input array
        character(len = len(elem) + len(x)) :: insert
        insert = x(:ind - 1) // elem // x(ind:)
    end function insert_char
end module mod_insert