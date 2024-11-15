Ttest <-
  function(Y, Predictors, data) {
  X <- as.matrix(Predictors)
  X <- cbind(1, X)  # Add intercept
  beta <- solve(t(X) %*% X) %*% t(X) %*% Y
  residuals <- Y - X %*% beta
  sigma2 <- sum(residuals^2) / (nrow(data) - ncol(X))
  var_beta <- sigma2 * diag(solve(t(X) %*% X))
  se <- sqrt(var_beta)
  t_values <- beta / se
  p_values <- 2 * pt(-abs(t_values), df = nrow(data) - ncol(X))
  result <- data.frame("Estimate" = beta, "Std. Error" = se, "t value" = t_values, "Pr(>|t|)" = p_values)
  colnames(result) <- c("Estimate", "Std. Error", "t value", "Pr(>|t|)")
  rownames(result) <- c("(Intercept)", colnames(Predictors))
  return(as.matrix(result))
}
