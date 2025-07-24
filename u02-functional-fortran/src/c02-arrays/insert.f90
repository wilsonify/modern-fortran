!! Inserts `elem` into index `ind` of array `x`.
module mod_insert
    use iso_fortran_env, only : i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
            r4 => real32, r8 => real64, r16 => real128
    use mod_limit
    implicit none
    interface insert
        module procedure insert_i1
        module procedure insert_i2
        module procedure insert_i4
        module procedure insert_i8
        module procedure insert_r4
        module procedure insert_r8
        module procedure insert_r16
        module procedure insert_c4
        module procedure insert_c8
        module procedure insert_c16
        module procedure insert_char
    end interface
contains

    pure function insert_i1(elem, ind, x) result(insert)
        !! Inserts `elem` into index `ind` of array `x`.
        !! This specific procedure is for 1-byte integers.

        integer(i1), intent(in) :: elem !! Element to insert
        integer(i4), intent(in) :: ind !! Index to insert element at
        integer(i1), dimension(:), intent(in) :: x !! Input array
        integer(i1), dimension(size(x) + 1) :: insert
        insert = [x(:limit(ind, 1, size(x) + 1) - 1), elem, x(limit(ind, 1, size(x) + 1):)]
    end function insert_i1


    pure function insert_i2(elem, ind, x) result(insert)

        !! This specific procedure is for 2-byte integers.

        integer(i2), intent(in) :: elem !! Element to insert
        integer(i4), intent(in) :: ind !! Index to insert element at
        integer(i2), dimension(:), intent(in) :: x !! Input array
        integer(i2), dimension(size(x) + 1) :: insert
        insert = [x(:limit(ind, 1, size(x) + 1) - 1), elem, x(limit(ind, 1, size(x) + 1):)]
    end function insert_i2


    pure function insert_i4(elem, ind, x) result(insert)

        !! This specific procedure is for 4-byte integers.

        integer(i4), intent(in) :: elem !! Element to insert
        integer(i4), intent(in) :: ind !! Index to insert element at
        integer(i4), dimension(:), intent(in) :: x !! Input array
        integer(i4), dimension(size(x) + 1) :: insert
        insert = [x(:limit(ind, 1, size(x) + 1) - 1), elem, x(limit(ind, 1, size(x) + 1):)]
    end function insert_i4


    pure function insert_i8(elem, ind, x) result(insert)

        !! This specific procedure is for 8-byte integers.

        integer(i8), intent(in) :: elem !! Element to insert
        integer(i4), intent(in) :: ind !! Index to insert element at
        integer(i8), dimension(:), intent(in) :: x !! Input array
        integer(i8), dimension(size(x) + 1) :: insert
        insert = [x(:limit(ind, 1, size(x) + 1) - 1), elem, x(limit(ind, 1, size(x) + 1):)]
    end function insert_i8


    pure function insert_r4(elem, ind, x) result(insert)

        !! This specific procedure is for 4-byte reals.

        real(r4), intent(in) :: elem !! Element to insert
        integer(i4), intent(in) :: ind !! Index to insert element at
        real(r4), dimension(:), intent(in) :: x !! Input array
        real(r4), dimension(size(x) + 1) :: insert
        insert = [x(:limit(ind, 1, size(x) + 1) - 1), elem, x(limit(ind, 1, size(x) + 1):)]
    end function insert_r4


    pure function insert_r8(elem, ind, x) result(insert)

        !! This specific procedure is for 8-byte reals.

        real(r8), intent(in) :: elem !! Element to insert
        integer(i4), intent(in) :: ind !! Index to insert element at
        real(r8), dimension(:), intent(in) :: x !! Input array
        real(r8), dimension(size(x) + 1) :: insert
        insert = [x(:limit(ind, 1, size(x) + 1) - 1), elem, x(limit(ind, 1, size(x) + 1):)]
    end function insert_r8


    pure function insert_r16(elem, ind, x) result(insert)

        !! This specific procedure is for 16-byte reals.

        real(r16), intent(in) :: elem !! Element to insert
        integer(i4), intent(in) :: ind !! Index to insert element at
        real(r16), dimension(:), intent(in) :: x !! Input array
        real(r16), dimension(size(x) + 1) :: insert
        insert = [x(:limit(ind, 1, size(x) + 1) - 1), elem, x(limit(ind, 1, size(x) + 1):)]
    end function insert_r16


    pure function insert_c4(elem, ind, x) result(insert)

        !! This specific procedure is for 4-byte complex numbers.

        complex(r4), intent(in) :: elem !! Element to insert
        integer(i4), intent(in) :: ind !! Index to insert element at
        complex(r4), dimension(:), intent(in) :: x !! Input array
        complex(r4), dimension(size(x) + 1) :: insert
        insert = [x(:limit(ind, 1, size(x) + 1) - 1), elem, x(limit(ind, 1, size(x) + 1):)]
    end function insert_c4


    pure function insert_c8(elem, ind, x) result(insert)

        !! This specific procedure is for 8-byte complex numbers.

        complex(r8), intent(in) :: elem !! Element to insert
        integer(i4), intent(in) :: ind !! Index to insert element at
        complex(r8), dimension(:), intent(in) :: x !! Input array
        complex(r8), dimension(size(x) + 1) :: insert
        insert = [x(:limit(ind, 1, size(x) + 1) - 1), elem, x(limit(ind, 1, size(x) + 1):)]
    end function insert_c8


    pure function insert_c16(elem, ind, x) result(insert)

        !! This specific procedure is for 16-byte complex numbers.

        complex(r16), intent(in) :: elem !! Element to insert
        integer(i4), intent(in) :: ind !! Index to insert element at
        complex(r16), dimension(:), intent(in) :: x !! Input array
        complex(r16), dimension(size(x) + 1) :: insert
        insert = [x(:limit(ind, 1, size(x) + 1) - 1), elem, x(limit(ind, 1, size(x) + 1):)]
    end function insert_c16


    pure function insert_char(elem, ind, x) result(insert)
        !! Inserts character string `elem` into
        !! index `ind` of character string `x`.

        character(len = *), intent(in) :: elem !! Character string to insert
        integer(i4), intent(in) :: ind !! Index to insert element at
        character(len = *), intent(in) :: x !! Input array
        character(len = len(elem) + len(x)) :: insert
        insert = x(:ind - 1) // elem // x(ind:)
    end function insert_char
end module mod_insert