

integer(kind = our_int) function run_em_exponential(y, &
        pi, lambda_1, lambda_2, iter, converged, loglik, &
        score, hessian, err, maxits, eps) result(answer)
    ! EM algorithm for computing ML estimates for the mixture of
    ! two exponentials,
    !         pi * exponential with mean 1/lambda_1
    ! + (1 - pi) * exponential with mean 1/lambda_2
    use program_constants
    use error_handler
    implicit none

    ! Input data containing the sample:
    real(kind = our_dble), intent(in) :: y(:)
    ! Starting values for parameters; these will also return
    ! the estimates:
    real(kind = our_dble), intent(inout) :: pi, lambda_1, lambda_2
    ! Number of EM iterations performed:
    integer(kind = our_int), intent(out) :: iter
    ! T if EM converged, F otherwise:
    logical, intent(out) :: converged
    ! Loglikelihood function and its first two derivatives at
    ! the parameter estimates:
    real(kind = our_dble), intent(out) :: loglik, score(3), &
            hessian(3, 3)
    ! Error messages:
    type(error_type), intent(inout) :: err
    ! Optional: maximum number of iterations and
    ! criterion for judging convergence.
    integer(kind = our_int), intent(in), optional :: maxits
    real(kind = our_dble), intent(in), optional :: eps
    ! locals
    integer(kind = our_int) :: max_iter, i, n
    real(kind = our_dble) :: epsilon, oldpi, oldlambda_1, &

            oldlambda_2, d, f, sumd, sumy, sumdy
    character(len = 12) :: sInt
    character(len = *), parameter :: subname = "run_em_exponential"
    ! begin
    answer = RETURN_FAIL
    score(:) = 0.
    hessian(:, :) = 0.
    ! check input arguments and set defaults
    if((pi < 0.) .or. (pi > 1.)) goto 300
    if((lambda_1 <= 0.) .or. (lambda_2 <= 0.)) goto 400
    if(present(maxits)) then
        if(maxits < 0) goto 500
        max_iter = maxits
    else
        max_iter = 1000
    end if
    if(present(eps)) then
        if(eps < 0.) goto 600
        epsilon = eps
    else
        epsilon = .00001
    end if
    ! run EM
    !!!! lines omitted !!!!
    ! normal exit
    answer = RETURN_SUCCESS
    return
    ! error traps
    300 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "Argument pi out of range.")
    return
    400 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "Argument lambda_1 or lambda_2 out of range.")
    return
    500 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "Invalid value for argument maxits.")
    return
    600 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "Invalid value for argument eps.")
    return
    ! run EM
    n = size(y)
    if(n == 0) goto 700
    sumy = sum(y)
    converged = .false.
    iter = 0
    do
        iter = iter + 1
        write(sInt, "(I12)") iter
        sInt = adjustl(sInt)
        oldpi = pi
        oldlambda_1 = lambda_1
        oldlambda_2 = lambda_2
        loglik = 0.
        sumd = 0.
        sumdy = 0.
        do i = 1, n
            f = pi * lambda_1 * exp(-lambda_1 * y(i)) &
                    + (1 - pi) * lambda_2 * exp(-lambda_2 * y(i))
            loglik = loglik + log(f)
            d = pi * lambda_1 * exp(-lambda_1 * y(i)) / f
            sumd = sumd + d
            sumdy = sumdy + d * y(i)
        end do
        pi = sumd / real(n)
        if(sumdy == 0.) goto 700
        lambda_1 = sumd / sumdy
        if(sumy == sumdy) goto 700
        lambda_2 = (real(n) - sumd) / (sumy - sumdy)
        converged = (abs(pi - oldpi) < epsilon) .and. &
                (abs(lambda_1 - oldlambda_1) < epsilon) .and. &
                (abs(lambda_2 - oldlambda_2) < epsilon)
        if((iter >= max_iter) .or. converged) exit
    end do
    if(.not. converged) &
            call err_handle(err, 1000, &
                    called_from = subname // " in MOD " // modname, &
                    custom_1 = "Algorithm failed to converge by " &
                            // "iteration " // trim(sInt))
    if(eval_score_and_hessian(y, pi, lambda_1, lambda_2, &
            score, hessian, err) == RETURN_FAIL) goto 800
    ! normal exit
    answer = RETURN_SUCCESS
    !!!! lines omitted !!!!
    700 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "Attempted division by zero;", &
            custom_2 = "EM algorithm aborted at iteration " &
                    // trim(sInt))
    return
    800 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname)
    return
end function run_em_exponential
