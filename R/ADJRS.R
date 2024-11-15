ADJRS <-
  function(Y, Predictors, data) {
  X <- as.matrix(Predictors)
  X <- cbind(1, X)  # Add intercept
  beta <- solve(t(X) %*% X) %*% t(X) %*% Y
  fitted_values <- X %*% beta
  ss_total <- sum((Y - mean(Y))^2)
  ss_residual <- sum((Y - fitted_values)^2)
  n <- nrow(data)
  p <- ncol(X)
  adj_rsquared <- 1 - ((ss_residual / (n - p)) / (ss_total/(n-1)))
  return(adj_rsquared)
}
