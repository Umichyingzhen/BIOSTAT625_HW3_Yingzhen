library(testthat)
library(MLST)
set.seed(246)
simulate_data <- data.frame(
  normal = rnorm(100, mean = 10, sd = 5),
  X1 = rnorm(100),
  X2 = rnorm(100),
  X3 = rnorm(100),
  X4 = rnorm(100)
)

Predictors <- as.matrix(simulate_data[, c("X1", "X2", "X3", "X4")])
Y <- as.matrix(simulate_data[, "normal"])

Rsquared_result <- Rsquared(Y, Predictors, simulate_data)
lm_model <- lm(normal ~ X1 + X2 + X3 + X4, simulate_data)

usethis::use_testthat()
usethis::use_test("Rsquared")
test_that("Rsquared works",{
  expect_equal(Rsquared_result, summary(lm_model)$r.squared)
})

devtools::test()
