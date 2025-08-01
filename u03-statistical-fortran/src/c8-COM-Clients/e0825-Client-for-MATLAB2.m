% Clear workspace and command window
clear all; clc;

% Parameters
ver = 1.1;
author = 'David R. Lemmon';

% Create the data array (viral dataset)
nvar = 3;
nkase = 5;
data = zeros(nkase, nvar);
data(:,1) = (-5:-1)';   % LOG_DOSE
data(:,2) = 6;          % N (denominator)
data(:,3) = [0; 1; 4; 6; 6]; % Y (response count)

% Create data labels cell array
varNames = {'LOG_DOSE', 'N', 'Y'};

% Create model specifications
resp = {'Y', 'N'};        % Response and denominator variables
inter = true;             % Include intercept in model
pred = 'LOG_DOSE';        % Predictor variable

% Fit model
eps = 1e-10;
maxits = 20;

[loglik, x2, g2, df, Beta, betaNames, CovBeta, converged, iter, err] ...
    = elogit(data, varNames, resp, inter, pred, eps, maxits);

% Check for errors
if ~isempty(err)
    fprintf('Error: %s\n', err);
else
    % Get size of Beta coefficients
    [szBeta, ~] = size(Beta);

    % Compute standard error from diagonal of covariance matrix
    stdErr = sqrt(cat(1, CovBeta{logical(eye(szBeta))}));

    % Convert Beta from cell to numeric vector
    aBeta = cat(1, Beta{:});

    % Compute z-ratio (coefficient divided by standard error)
    ratio = aBeta ./ stdErr;

    % Display results header
    fprintf('\nELogit.m\nLogistic Regression using the ELogit COM Server\n');
    fprintf('Version %4.1f\n%s\n', ver, author);

    % Date and time
    fprintf('\n%s\n', datestr(now));

    % Dataset info
    fprintf('\nData set information\n');
    fprintf('\tNumber of cases:     %5d\n', nkase);
    fprintf('\tNumber of variables: %5d\n', nvar);
    fprintf('\n\tVariables\n\t----------------\n');
    for i = 1:nvar
        fprintf('%8d\t%s\n', i, varNames{i});
    end

    % Model specification
    fprintf('\nModel specification\n');
    fprintf('\tResponse (y):       %s\n', resp{1});
    fprintf('\tDenominator (n):    %s\n', resp{2});
    fprintf('\tPredictors:\n');
    for i = 1:szBeta
        fprintf('\t\t%s\n', betaNames{i});
    end

    % Convergence info
    fprintf('\nIteratively reweighted least-squares algorithm\n');
    if converged
        fprintf('\tConverged at iteration %d\n', iter);
    else
        fprintf('\tFailed to converge by iteration %d\n', iter);
    end

    % Estimates
    fprintf('\nEstimate      Std.Err.      z-ratio\n');
    fprintf('-----------   ---------    ---------\n');
    for i = 1:szBeta
        fprintf('\t%s \t%9.4f\t%9.4f\t%9.4f\n', betaNames{i}, Beta{i}, stdErr(i), ratio(i));
    end

    % Model fit statistics
    fprintf('\nSummary of model fit\n');
    fprintf('\tLoglikelihood:    %11.8f\n', loglik);
    fprintf('\tDeviance G^2:     %11.8f\n', g2);
    fprintf('\tPearson''s X^2:    %11.8f\n', x2);
    fprintf('\tDegrees of freedom: %d\n', df);
end
