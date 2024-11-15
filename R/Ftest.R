Ftest <-
  function(Y, Predictors, data) {
  X <- as.matrix(Predictors)
  X <- cbind(1, X)  # Add intercept
  beta <- solve(t(X) %*% X) %*% t(X) %*% Y
  fitted_values <- X %*% beta
  ss_total <- sum((Y - mean(Y))^2)
  ss_residual <- sum((Y - fitted_values)^2)
  df1 <- ncol(X)-1  # Degrees of freedom for regression
  df2 <- nrow(data) - ncol(X)  # Degrees of freedom for error
  f_stat <- ((ss_total - ss_residual) / df1) / (ss_residual / df2)
  p_value <- pf(f_stat, df1, df2, lower.tail = FALSE)
  return(data.frame(f_stat = f_stat, p_value = p_value, df1 = df1, df2 = df2))
}
