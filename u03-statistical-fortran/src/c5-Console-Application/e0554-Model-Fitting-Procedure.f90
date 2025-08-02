
integer(our_int) function run_elogit_modelfit(session, err, &
        warn, maxits, eps) result(answer)
    ! Fits the logistic regression model by iteratively reweighted
    ! least squares, storing the final parameter value in
    ! param and the results in results.

    ! If it fails for any reason, param and results are nullified.
    implicit none
    ! declare arguments
    type(elogit_session_type), intent(inout) :: session
    type(error_type), intent(inout) :: err
    type(error_type), intent(inout), optional :: warn
    integer(kind = our_int), intent(in), optional :: maxits
    real(kind = our_dble), intent(in), optional :: eps
    ! declare local variables and parameters
    character(len = *), parameter :: subname = "run_elogit_modelfit"
    real(kind = our_dble), allocatable :: y(:), n(:), x(:, :), w(:), &
            pi(:), z(:), beta(:), beta_old(:), log_odds(:), &
            odds(:), cov_beta(:, :), dev(:)
    integer(kind = our_int) :: ncase, p, ijunk, status, j, posn
    integer(kind = our_int) :: maxits0
    real(kind = our_dble) :: eps0
    character(len = 12) :: sInt
    real(kind = our_dble), parameter :: log_huge = &
            log(huge(real(0, kind = our_dble)))
    real(kind = our_dble) :: scale
    ! check arguments
    answer = RETURN_FAIL
    if(session%dataset%is_null) goto 700
    if(session%model%is_null) goto 710
    ! allocate local arrays
    ncase = session%dataset%ncase
    p = session%model%npred
    if(session%model%intercept_present) p = p + 1
    if(p == 0) goto 720
    allocate(y(ncase), n(ncase), x(ncase, p), w(ncase), pi(ncase), &
            z(ncase), beta(p), beta_old(p), log_odds(ncase), &
            odds(ncase), cov_beta(p, p), dev(ncase), stat = status)
    if(status /= 0) goto 780
    ! fill in y, n, x
    y(:) = session%dataset%data_matrix(:, session%model%y_col)
    if(session%model%grouped) then
        n(:) = session%dataset%data_matrix(:, session%model%n_col)
    else
        n(:) = 1.D0
    end if
    posn = 0
    if(session%model%intercept_present) then
        posn = posn + 1
        x(:, posn) = 1.D0
    end if
    do j = 1, session%model%npred
        posn = posn + 1
        x(:, posn) = session%dataset%data_matrix(:, &
                session%model%pred_col(j))
    end do
    ! set maximum number of iterations and convergence criterion
    if(present(maxits)) then
        if(maxits < 0) goto 750

        maxits0 = maxits
    else
        maxits0 = 20
    end if
    if(present(eps)) then
        if(eps <= 0.D0) goto 760
        eps0 = eps
    else
        eps0 = 1D-08
    end if
    ! set starting value for beta
    beta(:) = 0.D0
    ! main iteration
    session%results%iter = 0
    session%results%converged = .false.
    do
        session%results%iter = session%results%iter + 1
        write(sInt, "(I12)") session%results%iter
        sInt = adjustl(sInt)
        ! for error reporting
        beta_old = beta
        log_odds = matmul(x, beta)
        if(any(log_odds > log_huge)) goto 820 ! to prevent overflow
        odds = exp(log_odds)
        pi = odds / (1.D0 + odds)
        w = n * pi * (1.D0 - pi)
        z = log_odds + (y - n * pi) / w
        if(fit_wls(x, z, w, beta, cov_beta, scale, err) &
                == RETURN_FAIL) goto 840
        if(all(abs(beta - beta_old) <= eps0 * abs(beta_old))) &
                session%results%converged = .true.
        if(session%results%converged .or. &
                (session%results%iter >= maxits0)) exit
    end do
    ! store the resulting estimate in param
    session%param%is_null = .false.
    session%param%p = p
    if(dyn_alloc(session%param%beta, session%param%p, err) &
            == RETURN_FAIL) goto 800
    session%param%beta = beta
    ! store the covariance matrix in results
    if(dyn_alloc(session%results%cov_beta, p, p, err) &
            == RETURN_FAIL) goto 800
    session%results%cov_beta(:, :) = cov_beta(:, :)
    ! calculate the fit statistics
    session%results%loglik = sum(y * log(pi) + (n - y) * log(1.D0 - pi))
    session%results%X2 = sum((y - n * pi)**2 / w)
    where((y /= 0.D0) .and. (y /= n)) &
            dev = y * log(y / (n * pi)) &
                    + (n - y) * log((n - y) / (n - n * pi))
    where(y == 0.D0) dev = n * log(n / (n - n * pi))
    where(y == n) dev = n * log(n / (n * pi))
    session%results%G2 = 2.D0 * sum(dev)
    session%results%df = ncase - p

    session%results%is_null = .false.
    ! issue warnings, if warranted
    if(present(warn)) then
        if(.not.session%results%converged) &
                call err_handle(warn, 1000, &
                        called_from = subname // " in MOD " // modname, &
                        custom_1 = &
                                "Did not converge by " // trim(sInt) // " iterations.")
    end if
    ! normal exit
    answer = RETURN_SUCCESS
    goto 999
    ! error traps
    700 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "No dataset has been loaded yet.")
    goto 999
    710 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "No model has been specified yet.")
    goto 999
    720 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "Model has no parameters.")
    goto 999
    750 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "Maximum no. of iterations cannot be negative.")
    goto 999
    760 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "Convergence criterion must be positive.")
    goto 999
    780 call err_handle(err, 200, &
            called_from = subname // " in MOD " // modname)
    goto 999
    800 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname)
    goto 999
    820 call err_handle(err, 104, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "during iteration " // trim(sInt), &
            custom_2 = "Model fit procedure aborted.")
    goto 999
    830 call err_handle(err, 102, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "during iteration " // trim(sInt), &
            custom_2 = "Model fit procedure aborted.")
    goto 999
    840 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "during iteration " // trim(sInt), &
            custom_2 = "Model fit procedure aborted.")

    goto 999
    ! final cleanup
    999 continue
    if(allocated(y)) deallocate(y)
    if(allocated(n)) deallocate(n)
    if(allocated(x)) deallocate(x)
    if(allocated(w)) deallocate(w)
    if(allocated(pi)) deallocate(pi)
    if(allocated(z)) deallocate(z)
    if(allocated(beta)) deallocate(beta)
    if(allocated(beta_old)) deallocate(beta_old)
    if(allocated(log_odds)) deallocate(log_odds)
    if(allocated(odds)) deallocate(odds)
    if(allocated(cov_beta)) deallocate(cov_beta)
    if(allocated(dev)) deallocate(dev)
    if(answer == RETURN_FAIL) then
        ijunk = nullify_elogit_session(session, err, &
                save_dataset = .true., save_model = .true.)
    end if
end function run_elogit_modelfit