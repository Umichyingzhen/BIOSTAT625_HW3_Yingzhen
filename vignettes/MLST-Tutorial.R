## -----------------------------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(MLST)

## -----------------------------------------------------------------------------
# simulated dataset

set.seed(123)
simulate_data <- data.frame(
  normal = rnorm(100, mean = 10, sd = 5),
  X1 = rnorm(100),
  X2 = rnorm(100),
  X3 = rnorm(100)
)

Predictors <- as.matrix(simulate_data[, c("X1", "X2")])
Y <- as.matrix(simulate_data[, "normal"])

## -----------------------------------------------------------------------------
RSE_result <- RSE(Y, Predictors, simulate_data)

Rsquared_result <- Rsquared(Y, Predictors, simulate_data)
print(Rsquared_result)

ADJRS_result <- ADJRS(Y, Predictors, simulate_data)
print(ADJRS_result)

Ftest_result <- Ftest(Y, Predictors, simulate_data)
print(Ftest_result)

Ttest_result <- Ttest(Y, Predictors, simulate_data)
print(Ttest_result)

## -----------------------------------------------------------------------------
# Fit the model with lm()
lm_model <- lm(normal ~ X1 + X2, simulate_data)

# Comparison of residual standard error
all.equal(RSE_result, summary(lm_model)$sigma)

# Comparison of R-squared
all.equal(Rsquared_result, summary(lm_model)$r.squared)

# Comparison of Adjusted R-squared
all.equal(ADJRS_result, summary(lm_model)$adj.r.squared)

# F-test comparison
all.equal(Ftest_result$f_stat, summary(lm_model)$fstatistic[1], check.attributes = FALSE)
all.equal(Ftest_result$p_value, pf(summary(lm_model)$fstatistic[1], summary(lm_model)$fstatistic[2], summary(lm_model)$fstatistic[3], lower.tail = FALSE), check.attributes = FALSE)
all.equal(Ftest_result$df1, summary(lm_model)$fstatistic[2], check.attributes = FALSE)
all.equal(Ftest_result$df2, summary(lm_model)$fstatistic[3], check.attributes = FALSE)

# T-test comparison
all.equal(Ttest_result[,1], summary(lm_model)$coefficients[, 1], check.attributes = FALSE)
all.equal(Ttest_result[,2], summary(lm_model)$coefficients[, 2], check.attributes = FALSE)
all.equal(Ttest_result[,3], summary(lm_model)$coefficients[, 3], check.attributes = FALSE)
all.equal(Ttest_result[,4], summary(lm_model)$coefficients[, 4], check.attributes = FALSE)

## -----------------------------------------------------------------------------
# Benchmarking RSE function vs. lm()
bench::mark(
  RSE_result,
  summary(lm_model)$sigma
)

# Benchmarking Rsquared function vs. lm()
bench::mark(
  Rsquared_result,
  summary(lm_model)$r.squared
)

# Benchmarking ADJRS function vs. lm()
bench::mark(
  ADJRS_result,
  summary(lm_model)$adj.r.squared
)

# Benchmarking Ftest function vs. lm()
bench::mark(
  Ftest_result$f_stat,
  summary(lm_model)$fstatistic[1],
  check = FALSE
)

bench::mark(
  Ftest_result$p_value,
  pf(summary(lm_model)$fstatistic[1], summary(lm_model)$fstatistic[2], summary(lm_model)$fstatistic[3], lower.tail = FALSE),
  check = FALSE)

bench::mark(
  Ftest_result$df1,
  summary(lm_model)$fstatistic[2],
  check = FALSE
)

bench::mark(
   Ftest_result$df2,
   summary(lm_model)$fstatistic[3],
   check = FALSE
)

# Benchmarking Ttest function vs. lm()
bench::mark(
  Ttest_result[,1],
  summary(lm_model)$coefficients[, 1],
  check = FALSE
)

bench::mark(
  Ttest_result[,2],
  summary(lm_model)$coefficients[, 2],
  check = FALSE
)

bench::mark(
  Ttest_result[,3],
  summary(lm_model)$coefficients[, 3],
  check = FALSE
)

bench::mark(
  Ttest_result[,4],
  summary(lm_model)$coefficients[, 4],
  check = FALSE
)

