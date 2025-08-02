module cholesky_module
    use program_constants
    use error_handler
    implicit none
    private
    public :: cholesky_saxpy
    character(len = *), parameter :: modname = "cholesky_module"
contains
    integer(kind = our_int) function cholesky_saxpy(a, err) result(answer)
        implicit none
        real(kind = our_dble), intent(inout) :: a(:, :)
        type(error_type), intent(inout) :: err
        character(len = *), parameter :: subname = "cholesky_saxpy"
        integer(kind = our_int) :: p, j, k
        real(kind = our_dble) :: den

        answer = RETURN_FAIL
        p = size(a, 1)
        if (p /= size(a, 2)) goto 700
        do j = 1, p
            do k = 1, j - 1
                a(j:p, j) = a(j:p, j) - a(j:p, k) * a(j, k)
            end do
            if (a(j, j) <= 0.D0) goto 710
            den = sqrt(a(j, j))
            a(j:p, j) = a(j:p, j) / den
        end do

        answer = RETURN_SUCCESS
        return

    700 call err_handle(err, 300, &
            called_from = subname // " in MOD " // modname)
        return
    710 call err_handle(err, 101, &
            called_from = subname // " in MOD " // modname)
        return

    end function cholesky_saxpy

end module cholesky_module
