elogit <- function(x, y, n, intercept = TRUE, maxits = 20, eps = 1e-08) {
  pEL <- create.ole.object("ELogitSrvr.ELogitObj")
  if (is.null(pEL)) stop("Unable to start ELOGIT COM server.")

  if (is.vector(x)) x <- matrix(x, ncol = 1)

  x.names <- dimnames(x)[[2]]
  if (is.null(x.names)) x.names <- paste("X", format(1:ncol(x)), sep = "")

  if (missing(n)) {
    data.matrix <- cbind(x, y)
    var.names <- c(x.names, "Y")
    resp.col <- ncol(data.matrix)
  } else {
    data.matrix <- cbind(x, y, n)
    var.names <- c(x.names, "Y", "N")
    resp.col <- c(ncol(data.matrix) - 1, ncol(data.matrix))
  }

  pred.col <- 1:ncol(x)

  result1 <- set.ole.property(pEL, list(
    "data_matrix" = data.matrix,
    "var_names" = var.names,
    "response_bycol" = resp.col,
    "intercept" = intercept,
    "pred_bycol" = pred.col
  ))

  if (!all(result1)) {
    err <- get.ole.property(pEL, "errMessage")$errMessage
    release.ole.object(pEL)
    stop(err)
  }

  call.ole.method(pEL, "modelfit", maxits, eps)

  if (get.ole.property(pEL, "errMessagePresent")$errMessagePresent) {
    err <- get.ole.property(pEL, "errMessage")$errMessage
    release.ole.object(pEL)
    stop(err)
  }

  result <- get.ole.property(pEL, c(
    "iter", "converged", "beta", "beta_names",
    "cov_beta", "loglik", "X2", "G2", "df"
  ))

  if (!result$converged) {
    warning(paste("Algorithm failed to converge by", format(result$iter), "iterations."))
  }

  # Rename fields
  names(result)[names(result) == "cov_beta"] <- "cov.beta"
  names(result)[names(result) == "beta_names"] <- "beta.names"

  result$cov.beta <- matrix(unlist(result$cov.beta), nrow = length(result$cov.beta))

  release.ole.object(pEL)

  # Include metadata
  result$intercept <- intercept
  result$var.names <- var.names
  result$resp.col <- resp.col
  result$pred.col <- pred.col
  result$data.matrix <- data.matrix
  result$elogit.ok <- TRUE

  return(result)
}
