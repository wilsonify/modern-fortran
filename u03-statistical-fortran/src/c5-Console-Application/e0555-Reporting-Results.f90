
integer(kind = our_int) function write_elogit_results_to_outfile(&
        output_file_name, session, err) result(answer)
    ! writes a formatted summary of results to the output file
    implicit none
    ! declare arguments
    character(len = file_name_length), intent(in) :: output_file_name
    type(elogit_session_type), intent(in) :: session
    type(error_type), intent(inout) :: err
    ! declare local variables and parameters
    integer(kind = our_int) :: i, ncase, nvar, iter, df
    logical :: converged
    character(len = var_name_length), pointer :: var_names(:) => null()
    real(kind = our_dble), pointer :: beta(:) => null(), &
            cov_beta(:, :) => null()
    real(kind = our_dble) :: est, SE, ratio, loglik, X2, G2
    character(len = 12) :: sInt, sRealA, sRealB, sRealC
    character(len = var_name_length), parameter :: var_blank = ""
    character(len = *), parameter :: subname = &
            "write_elogit_results_to_outfile"
    ! check arguments
    answer = RETURN_FAIL
    if(output_file_name == "") goto 700
    ! open output file
    open(unit = out_file_handle, file = output_file_name, &
            status = "REPLACE", action = "WRITE", err = 800)
    ! stamp output file with program information
    if(write_program_info_to_outfile(out_file_handle, err) &
            == RETURN_FAIL) goto 990
    write(unit = out_file_handle, fmt = "(A)", err = 820) "" ! blank line
    ! stamp output file with time and date
    if(write_date_and_time_to_outfile(out_file_handle, err) &
            == RETURN_FAIL) goto 990
    write(unit = out_file_handle, fmt = "(A)", err = 820) "" ! blank line
    ! Write information about data set
    if(get_elogit_ncase(ncase, session, err) == RETURN_FAIL) &
            goto 990
    if(get_elogit_nvar(nvar, session, err) == RETURN_FAIL) &
            goto 990
    if(get_elogit_var_names(var_names, session, err) == &
            RETURN_FAIL) goto 990
    write(unit = out_file_handle, fmt = "(A)", err = 820) &
            "Data set information"
    write(sInt, "(I12)") ncase
    sInt = adjustl(sInt)
    write(unit = out_file_handle, fmt = "(A)", err = 820) &
            " Number of cases: " // trim(sInt)
    write(sInt, "(I12)") nvar
    sInt = adjustl(sInt)
    write(unit = out_file_handle, fmt = "(A)", err = 820) &
            " Number of variables: " // trim(sInt)
    write(unit = out_file_handle, fmt = "(A)", err = 820) "" ! blank line
    ! List the variables
    write(unit = out_file_handle, fmt = "(A)", err = 820) &
            " Variables"
    write(unit = out_file_handle, fmt = "(A)", err = 820) &
            "    -------------"
    do i = 1, nvar
        write(unit = out_file_handle, fmt = "(3X,I3,2X,A)", err = 820) &
                i, trim(var_names(i))
    end do
    write(unit = out_file_handle, fmt = "(A)", err = 820) "" ! blank line
    ! Report model specification
    write(unit = out_file_handle, fmt = "(A)", err = 820) &
            "Model specification"
    if(get_elogit_response(var_names, session, err) &
            == RETURN_FAIL) goto 990
    write(unit = out_file_handle, fmt = "(A)", err = 820) &
            " Response (y): " // trim(var_names(1))
    if(size(var_names) > 1) then
        write(unit = out_file_handle, fmt = "(A)", err = 820) &
                " Denominator (n): " // trim(var_names(2))
    end if
    if(get_elogit_beta_names(var_names, session, err) &
            == RETURN_FAIL) goto 990
    if(associated(var_names)) then
        write(unit = out_file_handle, fmt = "(A)", err = 820) &
                " Predictors: " // trim(var_names(1))
        do i = 2, size(var_names)
            write(unit = out_file_handle, fmt = "(A)", err = 820) &
                    " " // trim(var_names(i))
        end do
    end if
    write(unit = out_file_handle, fmt = "(A)", err = 820) "" ! blank line
    ! report iteration details
    if(get_elogit_iter(iter, session, err) == RETURN_FAIL) goto 990
    if(get_elogit_converged(converged, session, err) &
            == RETURN_FAIL) goto 990
    write(unit = out_file_handle, fmt = "(A)", err = 820) &
            "Iteratively reweighted least-squares algorithm"
    write(sInt, "(I12)") iter
    sInt = adjustl(sInt)
    if(converged) then
        write(unit = out_file_handle, fmt = "(A)", err = 820) &
                " Converged at iteration " // trim(sInt)
    else
        write(unit = out_file_handle, fmt = "(A)", err = 820) &
                " Failed to converge by iteration " // trim(sInt)
    end if
    write(unit = out_file_handle, fmt = "(A)", err = 820) "" ! blank line
    ! report coefficients and standard errors
    if(get_elogit_beta(beta, session, err) &
            == RETURN_FAIL) goto 990
    if(get_elogit_cov_beta(cov_beta, session, err) &
            == RETURN_FAIL) goto 990
    write(unit = out_file_handle, fmt = "(A)", err = 820) &
            "   " // var_blank // " " // &
                    " estimate std.err. ratio"
    write(unit = out_file_handle, fmt = "(A)", err = 820) &
            " " // var_blank // " " // &
                    "------------ ------------ ------------"
    do i = 1, size(beta)
        est = beta(i)
        SE = sqrt(cov_beta(i, i))
        ratio = est / SE
        write(sRealA, "(G12.5)") est
        write(sRealB, "(G12.5)") SE
        write(sRealC, "(G12.5)") ratio
        write(unit = out_file_handle, fmt = "(A)", err = 820) &
                " " // var_names(i) // " " // &
                        sRealA // " " // sRealB // " " // sRealC
    end do
    write(unit = out_file_handle, fmt = "(A)", err = 820) "" ! blank line
    ! report goodness-of-fit measures
    if(get_elogit_loglik(loglik, session, err) &
            == RETURN_FAIL) goto 990
    if(get_elogit_X2(X2, session, err) == RETURN_FAIL) goto 990
    if(get_elogit_G2(G2, session, err) == RETURN_FAIL) goto 990
    if(get_elogit_df(df, session, err) == RETURN_FAIL) goto 990
    write(unit = out_file_handle, fmt = "(A)", err = 820) &

            "Summary of model fit"
    write(unit = out_file_handle, fmt = "(A)", err = 820) "" ! blank line
    write(unit = out_file_handle, fmt = "(A20,G15.8)", err = 820) &
            " Loglikelihood: ", loglik
    write(unit = out_file_handle, fmt = "(A20,G15.8)", err = 820) &
            " Deviance G^2: ", G2
    write(unit = out_file_handle, fmt = "(A20,G15.8)", err = 820) &
            " Pearson’s X^2: ", X2
    write(unit = out_file_handle, fmt = "(A)", err = 820) "" ! blank line
    write(sInt, "(I12)") df
    sInt = adjustl(sInt)
    write(unit = out_file_handle, fmt = "(A)", err = 820) &
            " Degrees of freedom: " // trim(sInt)
    ! normal exit
    close(unit = out_file_handle)
    answer = RETURN_SUCCESS
    return
    ! error traps
    700 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname, &
            custom_1 = "No output file name specified.")
    return
    800 call err_handle(err, 2, &
            called_from = subname // " in MOD " // modname, &
            file_name = output_file_name)
    return
    820 call err_handle(err, 4, &
            called_from = subname // " in MOD " // modname, &
            file_name = output_file_name)
    close(unit = out_file_handle)
    return
    990 call err_handle(err, 1000, &
            called_from = subname // " in MOD " // modname)
    close(unit = out_file_handle)
    return
end function write_elogit_results_to_outfile
