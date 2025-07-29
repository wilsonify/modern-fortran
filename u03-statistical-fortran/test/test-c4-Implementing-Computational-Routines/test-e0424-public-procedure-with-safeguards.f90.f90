!#######################################################################
program em_test
    ! quick and dirty test program
    use error_handler
    use program_constants
    use em_exponential_engine
    implicit none
    ! declare variables
    type(error_type) :: err
    real(kind = our_dble) :: y(50), pi = .30, lambda_1 = 0.5, lambda_2 = 2.0, &
            loglik, score(3), hessian(3, 3)
    integer(kind = our_int) :: iter, i
    logical :: converged
    character(len = *), parameter :: platform = "PC"
    character(len = 256) :: msg_string
    ! begin
    open(10, file = "good50.dat")
    read(10, *) (y(i), i = 1, 50)
    close(10)
    if(run_em_exponential(y, pi, lambda_1, lambda_2, iter, &
            converged, loglik, score, hessian, err) == RETURN_FAIL) &
            goto 800
    print *, "Iterations:", iter
    print *, "Converged:", converged
    print *, "Pi = ", pi
    print *, "Lambda_1 = ", lambda_1
    print *, "Lambda_2 = ", lambda_2
    print *, "Loglik = ", loglik
    print *, "Score:"
    print *, score(:)
    print *, "Hessian:"
    do i = 1, 3
        print *, hessian(i, :)
    end do
    800 continue
    ! report error message
    if(err_msg_present(err)) then
        call err_get_msgs(err, msg_string, platform)
        print "(A)", trim(msg_string)
        print "(A)", "Aborted"
    end if
end program em_test
!#######################################################################