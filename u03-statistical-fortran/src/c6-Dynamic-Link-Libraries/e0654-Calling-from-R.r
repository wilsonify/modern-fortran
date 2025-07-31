em.exponential <- function( y, start, eps=.00001, maxits=10000 ){
# client function for the em exponential dll server
if( missing(start) ){
# generate starting values by a random split
w <- sample( 1:2, length(y), replace=T )
start <- list(
pi = mean( w==1 ),
lambda.1 = 1./mean( y[w==1] ),
lambda.2 = 1./mean( y[w==2] ) ) }
msg.len <- 255
msg <- ""
for(i in 1:msg.len) msg<-paste(msg," ",sep="")
tmp <- .Fortran("em_exponential",
n = length(y),
y = as.double(y),
maxits = as.integer(maxits),
eps = as.double(eps),
pi = as.double(start$pi),
lambda.1 = as.double(start$lambda.1),
lambda.2 = as.double(start$lambda.2),
iter = integer(1),
converged = logical(1),
loglik = numeric(1),
score = numeric(3),
hessian = matrix(0.,3,3),
msg.len = as.integer(msg.len),
msg = msg)
est <- list( pi = tmp$pi, lambda.1 = tmp$lambda.1,
lambda.2 = tmp$lambda.2 )
list( est = est, converged = tmp$converged )
msg <- tmp$msg
if( is.all.white( msg ) )
msg <- NULL
else{
# trim off the white space from msg and print to screen
i <- msg.len
while( ( substring( msg, i, i) == " " ) & ( i >= 0 ) ) i <- i-1
msg <- paste( substring( msg, 1, i ), "\n", sep="" )
cat(msg)}
result <- list(
est = est,
iter = tmp$iter,
converged = tmp$converged,
logliklihood = tmp$loglik,
score = tmp$score,
hessian = tmp$hessian,
msg = msg)
result}
#######################################################################