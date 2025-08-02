
subroutine em_exponential(n, y, maxits, eps, pi, lambda_1, lambda_2, &
        iter, converged, loglik, score, hessian, msg_len, msg)
    !DEC$ ATTRIBUTES DLLEXPORT :: em_exponential
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
    integer, intent(in) :: msg_len
    character(len = msg_len) :: msg
    ! declare locals
    integer(kind = our_int) :: ijunk
    type(error_type) :: err
    ! begin
    call err_reset(err)
    ijunk = run_em_exponential(y, pi, lambda_1, lambda_2, &
            iter, converged, loglik, score, hessian, err, maxits, eps)
    if(err_msg_present(err)) call err_get_msgs(err, msg, "UNIX")
    return
end subroutine em_exponential
