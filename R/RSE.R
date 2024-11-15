RSE <-
  function(Y, Predictors, data) {
  X <- as.matrix(Predictors)
  X <- cbind(1, X)  # Add intercept
  beta <- solve(t(X) %*% X) %*% t(X) %*% Y
  residuals <- Y - X %*% beta
  rse <- sqrt(sum(residuals^2) / (nrow(X) - ncol(X)))
  return(rse)
}
