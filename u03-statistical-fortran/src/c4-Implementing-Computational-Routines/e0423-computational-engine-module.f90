module em_exponential_engine

    use error_handler
    use program_constants
    implicit none
    private ! hide all by default

    !-------------------------------
    ! Public API
    public :: run_em_exponential
    public :: cholesky_saxpy
    public :: invert_lower
    public :: premult_lower_by_transpose
    public :: fit_wls
    !-------------------------------

    !-------------------------------
    ! Module metadata
    character(len = *), parameter :: modname = "em_exponential_engine"
    !-------------------------------

    !--------------------------------------------------------------
    ! Procedure interfaces for separately defined procedures
    !--------------------------------------------------------------
    interface

        subroutine run_em_exponential(n, p, y, max_iter, beta, converged, loglikelihood, tol)
            import :: our_dble
            import
            integer, intent(in) :: n, p, max_iter
            real(our_dble), intent(in) :: y(n)
            real(our_dble), intent(inout) :: beta(p)
            logical, intent(out) :: converged
            real(our_dble), intent(out) :: loglikelihood
            real(our_dble), intent(in), optional :: tol
        end subroutine run_em_exponential

        subroutine cholesky_saxpy(a, n, info)
            import :: our_dble
            import
            real(our_dble), intent(inout) :: a(n, n)
            integer, intent(in) :: n
            integer, intent(out) :: info
        end subroutine cholesky_saxpy

        subroutine invert_lower(l, n, info)
            import :: our_dble
            import
            real(our_dble), intent(inout) :: l(n, n)
            integer, intent(in) :: n
            integer, intent(out) :: info
        end subroutine invert_lower

        subroutine premult_lower_by_transpose(l, b, n)
            import :: our_dble
            import
            real(our_dble), intent(in) :: l(n, n)
            real(our_dble), intent(inout) :: b(n)
            integer, intent(in) :: n
        end subroutine premult_lower_by_transpose

        subroutine fit_wls(x, y, w, beta, n, p)
            import :: our_dble
            import
            integer, intent(in) :: n, p
            real(our_dble), intent(in) :: x(n, p), y(n), w(n)
            real(our_dble), intent(out) :: beta(p)
        end subroutine fit_wls
    end interface

contains
    ! leave empty unless you define any small routines directly here
end module em_exponential_engine

