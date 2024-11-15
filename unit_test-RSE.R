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

RSE_result <- RSE(Y, Predictors, simulate_data)
RSE_result
lm_model <- lm(normal ~ X1 + X2 + X3 + X4, simulate_data)

usethis::use_testthat()
usethis::use_test("RSE")
test_that("RSE works",{
  expect_equal(RSE_result, summary(lm_model)$sigma)
})

devtools::test()

