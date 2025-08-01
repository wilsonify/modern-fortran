function [loglik, x2, g2, df, Beta, betaNames, CovBeta, ...
    converged, iter, err ] ...
    = elogit(data, varNames, resp, inter, pred, eps, maxits)
    % Begin try/catch
    err = ’’;
    try
        % Create an elogit object instance
        h = actxserver( ’ELogitSrvr.ELogitObj’);

        % Load the data matrix and column labels
        set(h, ’data_matrix’, data);
        set(h, ’var_names’, varNames);

        % Load the model specification
        set(h, ’response_byname’, resp);
        set(h, ’intercept’, inter);
        set(h, ’pred_byname’, pred);

        % Fit the model
        invoke( h, ’modelfit’, maxits, eps );

        % Get convergence info
        converged = get(h, ’converged’);
        iter = get(h, ’iter’);

        % Get general statistics
        loglik = get(h, ’loglik’);
        g2 = get(h,’g2’);
        x2 = get(h,’x2’);
        df = double(get(h,’df’));

        % Get parameter estimates
        Beta = get(h, ’beta’);
        CovBeta = get(h,’cov_Beta’);
        betaNames = get(h,’beta_Names’);
        catch %Error handler
        if get(h, ’errMsgPresent’)
            err = get(h,’errMessage’);
        else
            err = lasterr;
    end
end
% Release the COM Server object
release(h);