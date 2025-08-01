elogit <- function(x, y, n, intercept=T, maxits=20, eps=1e-08){
# Create an elogit object instance
pEL <- create.ole.object("ELogitSrvr.ELogitObj")
if( is.null(pEL) ){
stop("Unable to start ELOGIT COM server.")}
# Coerce x into a matrix, if necessary
if( is.vector(x) ){
x <- matrix(x, ncol=1)}
# Set up names for X-variables
x.names <- dimnames(x)[[2]]
if( is.null( x.names ) ){
x.names_paste( "X", format(1:ncol(x)), sep="")}
# Set up the data matrix, variable names and column numbers
if( missing(n) ){
data.matrix <- cbind(x,y)
var.names <- c( x.names, "Y" )
resp.col <- ncol(data.matrix)
}
else{
data.matrix <- cbind(x,y,n)
var.names <- c( x.names, "Y", "N" )
resp.col <- c( ncol(data.matrix)-1, ncol(data.matrix) )
}
pred.col <- 1:ncol(x)
# Load the data matrix, variable names and model specification
result <- set.ole.property(pEL,
list("data_matrix"=data.matrix, "var_names"=var.names,
"response_bycol"=resp.col, "intercept"=intercept,
"pred_bycol"=pred.col) )
if( !all(result) ){
err <- get.ole.property(pEL, "errMessage")$errMessage
release.ole.object(pEL)
stop(err)}
# Fit the model
result <- call.ole.method(pEL, "modelfit", maxits, eps)
if( get.ole.property(pEL, "errMessagePresent")$errMessagePresent ){
err <- get.ole.property(pEL, "errMessage")$errMessage
release.ole.object(pEL)
stop(err)
}
# Get results
result <- get.ole.property(pEL,
c( "iter", "converged", "beta", "beta_names", "cov_beta",
"loglik", "X2", "G2", "df") )
if( !result$converged ){
warning( paste("Algorithm failed to converge by",
format(result$iter), "iterations."))
}
# change underscore to period in list names
names(result)[ names(result)=="cov_beta" ] <- "cov.beta"
names(result)[ names(result)=="beta_names" ] <- "beta.names"
# convert covbeta from a list of vectors into a square matrix
result$cov.beta <- matrix(unlist(result$cov.beta),
nrow=length(result$cov.beta))
# Unload the eLogit object
release.ole.object(pEL)
# Return list of results
result}

elogit.print_function( result ){
# print table of coefficients
coef <- result$beta
SE <- sqrt( diag( result$cov.beta ) )
z <- coef/SE
pval <- 2 * pnorm(-abs(z))
coef.table <- cbind( coef, SE, z, pval)
dimnames( coef.table ) <- list(
result$beta.names, c("coef", "SE", "z", "pval") )
cat( "Summary of estimated coefficients:\n")
print(coef.table)
# print convergence summary
cat("\n")
if( result$converged ){
cat( paste( "Algorithm converged in",
format(result$iter), "iterations.", "\n"))
}
else{
cat( paste( "Algorithm failed to converged by",
format(result$iter), "iterations.", "\n"))
}
# print fit statistics
cat("\n")
cat( "Summary of model fit:\n")
cat( paste(
c("Loglikelihood =", "Pearson X2
=", "Deviance G2
="),
format( c( result$loglik, result$X2, result$G2 ) )), sep="\n")
cat( paste(
"Degrees of freedom:", format(result$df), "\n"))
# return a non-printing NULL value
invisible()
}