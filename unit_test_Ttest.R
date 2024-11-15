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

Ttest_result <- Ttest(Y, Predictors, simulate_data)
lm_model <- lm(normal ~ X1 + X2 + X3 + X4, simulate_data)

usethis::use_testthat()
usethis::use_test("Ttest")
test_that("Ttest works",{
  expect_equal(Ttest_result[,1], summary(lm_model)$coefficients[, 1])
  expect_equal(Ttest_result[,2], summary(lm_model)$coefficients[, 2])
  expect_equal(Ttest_result[,3], summary(lm_model)$coefficients[, 3])
  expect_equal(Ttest_result[,4], summary(lm_model)$coefficients[, 4])
})

devtools::test()
