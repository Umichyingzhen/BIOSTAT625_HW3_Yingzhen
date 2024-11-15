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

Ftest_result <- Ftest(Y, Predictors, simulate_data)
lm_model <- lm(normal ~ X1 + X2 + X3 + X4, simulate_data)

usethis::use_testthat()
usethis::use_test("Ftest")
test_that("Ftest works",{
  expect_equal(Ftest_result$f_stat, summary(lm_model)$fstatistic[1])
  expect_equal(Ftest_result$p_value, pf(summary(lm_model)$fstatistic[1], summary(lm_model)$fstatistic[2], summary(lm_model)$fstatistic[3], lower.tail = FALSE))
  expect_equal(Ftest_result$df1, summary(lm_model)$fstatistic[2])
  expect_equal(Ftest_result$df2, summary(lm_model)$fstatistic[3])
})

devtools::test()
