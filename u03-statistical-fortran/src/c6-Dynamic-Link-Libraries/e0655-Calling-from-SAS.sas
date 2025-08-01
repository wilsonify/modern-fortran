proc iml;
/* IML module for exponential mixture model */
start em_exp(y, eps, maxits, pi, lambda_1, lambda_2, score, hessian);
    filename sascbtbl ’em_exp.cbt’;

    /* initializations */
    n = nrow(y);
    converged = 0;
    iter = 0;
    loglik = 0.0;

    /* Make enough room for 255 characters in msg */
    msg = ’’;
    do i=1 to 51;
        msg = msg + ’
    ’;
    end;
    blank_msg = msg;
    if type(pi) = ’U’ then do; /* pi not defined */
        /* generate starting values by a random split */
        w = round(uniform(shape( 0, 1, n ))) + 1;
        pi = sum( w=1 )/n;
        lambda_1 = sum(w=1)/( (w=1) * y );
        lambda_2 = sum(w=2)/( (w=2) * y );
    end;

    /* Shape the score and Hessian arrays */
    score = shape( 0.0, 3, 1);
    hessian = shape( 0.0, 3, 3);
    /* Run estimation */
    call modulei(’em_exponential_’, n, y,
    maxits, eps, pi, lambda_1, lambda_2,
    iter, converged, loglik, score, hessian,
    255, msg);
    if msg ^= blank_msg then do;
        print ’Error: ’, msg;
    end;

finish; /* em_exp */

/* good sample */
y = { 5.6, 0.7, 2.4, 2.2, 4.5, 0.6, 2.3, 3.1, 1.6, 2.2,
0.1, 4.9, 9.0, 7.4, 1.8, 9.7, 0.9, 1.0, 0.7, 3.4,
1.8, 0.5, 0.1, 0.7, 0.1, 6.6, 1.6, 8.6, 0.3, 0.1,
4.2, 0.8, 3.1, 0.2, 1.0, 2.0, 2.3, 0.8, 6.6, 1.2,
0.3, 2.7, 0.5, 0.7, 1.8, 1.5, 2.8, 18.3, 1.2, 0.6 };
maxits = 10000;
eps = 1.0E-5;
run em_exp(y, eps, maxits, pi2, lambda_1, lambda_2,
score, hessian);
/* Display results */
print ’Final Estimates:’;
print (pi2), , (lambda_1), , (lambda_2);
print (score);
cov = inv(-hessian);
print (cov);
quit;