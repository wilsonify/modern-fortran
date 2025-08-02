integer(kind = our_int) function invert_lower(a, err) result(answer)
    Overwrites a lower-triangular matrix a with its inverse
    by forward substitution. The upper triangle is untouched.
    implicit none
    ! declare arguments
    real(kind = our_dble), intent(inout) :: a(:, :)
    type(error_type), intent(inout) :: err
    ! declare local variables and parameters
    character(len = *), parameter :: subname = "invert_lower"
    integer(kind = our_int) :: p, i, j, k
    real(kind = our_dble) :: sum
    ! begin
    answer = RETURN_FAIL
    p = size(a, 1)
    if(p /= size(a, 2)) goto 700
    if(a(1, 1) == 0.D0) goto 710
    a(1, 1) = 1.D0 / a(1, 1)
    do i = 2, p
        if(a(i, i) == 0.D0) goto 710
        a(i, i) = 1.D0 / a(i, i)
        do j = 1, i - 1
            sum = 0.D0
            do k = j, i - 1
                sum = sum + a(k, j) * a(i, k)
            end do
            a(i, j) = - sum * a(i, i)
        end do
    end do
    ! normal exit
    answer = RETURN_SUCCESS
    return
    ! error traps
    700 call err_handle(err, 300, &
            called_from = subname // " in MOD " // modname)
    return
    710 call err_handle(err, 100, &
            called_from = subname // " in MOD " // modname)
    return
end function invert_lower


integer(kind = our_int) function premult_lower_by_transpose(a, b, &
        err) result(answer)
    Premultiplies a lower-triangular matrix a by its upper-
    triangular transpose to produce a symmetric matrix b.
    implicit none
    ! declare arguments
    real(kind = our_dble), intent(in) :: a(:, :)
    real(kind = our_dble), intent(out) :: b(:, :)
    type(error_type), intent(inout) :: err

    ! declare local variables and parameters
    character(len = *), parameter :: subname = &
            "premult_lower_by_transpose"
    integer(kind = our_int) :: p, i, j, k
    ! begin
    answer = RETURN_FAIL
    p = size(a, 1)
    if(p /= size(a, 2)) goto 700
    if((p /= size(b, 1)) .or. (p /= size(b, 2))) goto 710
    do i = 1, p
        do j = 1, i
            b(i, j) = 0.D0
            do k = max(i, j), p
                ! skip zero elements
                b(i, j) = b(i, j) + a(k, i) * a(k, j)
            end do
            b(j, i) = b(i, j)
            ! copy upper triangle from lower
        end do
    end do
    ! normal exit
    answer = RETURN_SUCCESS
    return
    ! error traps
    700 call err_handle(err, 300, &
            called_from = subname // " in MOD " // modname)
    return
    710 call err_handle(err, 301, &
            called_from = subname // " in MOD " // modname)
    return
end function premult_lower_by_transpose
