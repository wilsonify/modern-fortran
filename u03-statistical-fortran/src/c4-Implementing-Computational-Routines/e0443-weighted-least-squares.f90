module weighted_least_squares_mod
    use program_constants
    use error_handler
    use cholesky_module
    use linear_algebra_mod
    implicit none
    private
    public :: fit_wls

    character(len=*), parameter :: modname = "weighted_least_squares_mod"

contains

    integer(kind = our_int) function fit_wls(x, y, w, beta, cov_unscaled, scale, err) result(answer)
        implicit none
        real(kind = our_dble), intent(in) :: x(:, :), y(:), w(:)
        real(kind = our_dble), intent(out) :: beta(:), cov_unscaled(:, :), scale
        type(error_type), intent(inout) :: err

        character(len = *), parameter :: subname = "fit_wls"
        real(kind = our_dble), allocatable :: xtwx(:, :), xtwy(:)
        integer(kind = our_int) :: n, p, i, j, k, status

        ! initialize
        answer = RETURN_FAIL
        n = size(x, 1)
        p = size(x, 2)

        if ((size(y) /= n) .or. (size(beta) /= p) .or. &
            (size(w) /= n) .or. (size(cov_unscaled, 1) /= p) .or. &
            (size(cov_unscaled, 2) /= p)) goto 700

        allocate(xtwx(p, p), xtwy(p), stat=status)
        if (status /= 0) goto 710

        do j = 1, p
            xtwy(j) = sum(x(:, j) * w(:) * y(:))
            do k = 1, j
                xtwx(j, k) = sum(x(:, j) * w(:) * x(:, k))
            end do
        end do

        if (cholesky_saxpy(xtwx, err) == RETURN_FAIL) goto 800
        if (invert_lower(xtwx, err) == RETURN_FAIL) goto 800
        if (premult_lower_by_transpose(xtwx, cov_unscaled, err) == RETURN_FAIL) goto 800

        beta = matmul(cov_unscaled, xtwy)

        scale = 0.0D0
        do i = 1, n
            scale = scale + w(i) * (y(i) - sum(x(i, :) * beta))**2
        end do
        scale = scale / real(n - p, kind=our_dble)

        deallocate(xtwx, xtwy, stat=status)
        if (status /= 0) goto 720

        answer = RETURN_SUCCESS
        return

    700 call err_handle(err, 301, called_from = subname // " in MOD " // modname)
        return
    710 call err_handle(err, 200, called_from = subname // " in MOD " // modname)
        return
    720 call err_handle(err, 201, called_from = subname // " in MOD " // modname)
        return
    800 call err_handle(err, 1000, called_from = subname // " in MOD " // modname)
        deallocate(xtwx, xtwy)
        return

    end function fit_wls

end module weighted_least_squares_mod
