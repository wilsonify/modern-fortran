subroutine em_exponential(n, y, maxits, eps, pi, lambda_1, lambda_2, &
        iter, converged, loglik, score, hessian, error_occurred)
    use error_handler
    use program_constants
    use em_exponential_engine
    implicit none
    ! declare arguments
    integer, intent(in) :: n
    real(kind = our_dble), intent(in) :: y(n)
    integer, intent(in) :: maxits
    real(kind = our_dble), intent(in) :: eps
    real(kind = our_dble), intent(inout) :: pi, lambda_1, lambda_2
    integer, intent(out) :: iter
    logical, intent(out) :: converged
    real(kind = our_dble), intent(out) :: loglik, score(3), hessian(3, 3)
    logical, intent(out) :: error_occurred
    ! declare locals
    integer(kind = our_int) :: ijunk
    type(error_type) :: err
    character(len = 512) :: msg
    ! begin
    call err_reset(err)
    ijunk = run_em_exponential(y, pi, lambda_1, lambda_2, &
            iter, converged, loglik, score, hessian, err, maxits, eps)
    if(err_msg_present(err)) then
        error_occurred = .true.
        call err_get_msgs(err, msg, "UNIX")
        open(9, file = "c:\em_exp_error.txt")
        write(9, *) msg
        close(9)
    else
        error_occurred = .false.

    end if
    return
end subroutine em_exponential
