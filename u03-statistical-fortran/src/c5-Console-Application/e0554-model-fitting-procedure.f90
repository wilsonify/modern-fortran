integer(our_int) function run_elogit_modelfit(session, err, &
        warn, maxits, eps) result(answer)
    use program_constants
    use error_handler
    use elogit_data_mod
    implicit none
    ! Local arrays - auto-allocated (stack)
    real(our_dble) :: y(ncase), n(ncase), x(ncase, p)
    real(our_dble) :: w(ncase), pi(ncase), z(ncase)
    real(our_dble) :: beta(p), beta_old(p)
    real(our_dble) :: log_odds(ncase), odds(ncase)
    real(our_dble) :: cov_beta(p, p), dev(ncase)

    ! Arguments
    type(elogit_session_type), intent(inout) :: session
    type(error_type), intent(inout) :: err
    type(error_type), intent(inout), optional :: warn
    integer(kind = our_int), intent(in), optional :: maxits
    real(kind = our_dble), intent(in), optional :: eps

    ! Constants and temporary
    character(len = *), parameter :: subname = "run_elogit_modelfit"
    real(kind = our_dble), parameter :: log_huge = log(huge(1.0_our_dble))

    ! Local variables
    integer(our_int) :: ncase, p, ijunk, status, j, posn
    integer(our_int) :: maxits0
    real(our_dble) :: eps0
    character(len = 12) :: sInt
    real(our_dble) :: scale

    ! Derived problem dimensions
    ncase = session%dataset%ncase
    p = session%model%npred
    if (session%model%intercept_present) p = p + 1
    if (p == 0) goto 720


    ! Initialization and argument checks
    answer = RETURN_FAIL
    if (session%dataset%is_null) goto 700
    if (session%model%is_null) goto 710

    ! Fill y and n
    y(:) = session%dataset%data_matrix(:, session%model%y_col)
    if (session%model%grouped) then
        n(:) = session%dataset%data_matrix(:, session%model%n_col)
    else
        n(:) = 1.0_our_dble
    end if

    ! Build design matrix X
    posn = 0
    if (session%model%intercept_present) then
        posn = posn + 1
        x(:, posn) = 1.0_our_dble
    end if
    do j = 1, session%model%npred
        posn = posn + 1
        x(:, posn) = session%dataset%data_matrix(:, session%model%pred_col(j))
    end do

    ! Set defaults
    maxits0 = merge(maxits, 20, present(maxits))
    if (present(maxits)) then
        if (maxits < 0) goto 750
        maxits0 = maxits
    end if
    if (present(eps)) then
        if (eps <= 0.0_our_dble) goto 760
        eps0 = eps
    else
        eps0 = 1.0e-8_our_dble
    end if

    beta(:) = 0.0_our_dble
    session%results%iter = 0
    session%results%converged = .false.

    ! Iterative Reweighted Least Squares loop
    do
        session%results%iter = session%results%iter + 1
        write(sInt, '(I12)') session%results%iter
        sInt = adjustl(sInt)
        beta_old = beta

        log_odds = matmul(x, beta)
        if (any(log_odds > log_huge)) goto 820

        odds = exp(log_odds)
        pi = odds / (1.0_our_dble + odds)
        w = n * pi * (1.0_our_dble - pi)
        z = log_odds + (y - n * pi) / w

        if (fit_wls(x, z, w, beta, cov_beta, scale, err) == RETURN_FAIL) goto 840

        if (all(abs(beta - beta_old) <= eps0 * abs(beta_old))) then
            session%results%converged = .true.
        end if

        if (session%results%converged .or. session%results%iter >= maxits0) exit
    end do

    ! Store results
    session%param%is_null = .false.
    session%param%p = p
    session%param%beta(1:p) = beta

    session%results%cov_beta(1:p, 1:p) = cov_beta

    session%results%loglik = sum(y * log(pi) + (n - y) * log(1.0_our_dble - pi))
    session%results%X2 = sum((y - n * pi)**2 / w)

    where ((y /= 0.0_our_dble) .and. (y /= n))
        dev = y * log(y / (n * pi)) + (n - y) * log((n - y) / (n - n * pi))
    elsewhere (y == 0.0_our_dble)
        dev = n * log(n / (n - n * pi))
    elsewhere (y == n)
        dev = n * log(n / (n * pi))
    end where

    session%results%G2 = 2.0_our_dble * sum(dev)
    session%results%df = ncase - p
    session%results%is_null = .false.

    if (present(warn)) then
        if (.not. session%results%converged) then
            call err_handle(warn, 1000, &
                    called_from = subname // " in MOD " // modname, &
                    custom_1 = "Did not converge by " // trim(sInt) // " iterations.")
        end if
    end if

    answer = RETURN_SUCCESS
    goto 999

    ! Error handling
    700 call err_handle(err, 1000, called_from = subname // " in MOD " // modname, &
            custom_1 = "No dataset has been loaded yet."); goto 999
    710 call err_handle(err, 1000, called_from = subname // " in MOD " // modname, &
            custom_1 = "No model has been specified yet."); goto 999
    720 call err_handle(err, 1000, called_from = subname // " in MOD " // modname, &
            custom_1 = "Model has no parameters."); goto 999
    750 call err_handle(err, 1000, called_from = subname // " in MOD " // modname, &
            custom_1 = "Maximum no. of iterations cannot be negative."); goto 999
    760 call err_handle(err, 1000, called_from = subname // " in MOD " // modname, &
            custom_1 = "Convergence criterion must be positive."); goto 999
    820 call err_handle(err, 104, called_from = subname // " in MOD " // modname, &
            custom_1 = "during iteration " // trim(sInt), &
            custom_2 = "Model fit procedure aborted."); goto 999
    840 call err_handle(err, 1000, called_from = subname // " in MOD " // modname, &
            custom_1 = "during iteration " // trim(sInt), &
            custom_2 = "Model fit procedure aborted."); goto 999

    999 continue
    if (answer == RETURN_FAIL) then
        ijunk = nullify_elogit_session(session, err, &
                save_dataset = .true., save_model = .true.)
    end if
end function run_elogit_modelfit
