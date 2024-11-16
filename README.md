# MLST: Statistical Analysis and Regression Tools in R

**MLST** is a R package for obtaining tests results and statistics of a linear regression models

## Features

- **Residual Standard Error (RSE)**: Compute the residual standard error for linear regression models.
- **R-Squared (\( R^2 \))**: Calculate the coefficient of determination to assess model fit.
- **Adjusted R-Squared**: Evaluate the adjusted \( R^2 \), accounting for the number of predictors in the model.
- **F-test**: Evaluate the overall significance of a multiple linear model, consist of F-statistics, p-value, the first degrees of freedom, and the second degrees of freedom.
- **T-test**: Evaluate the individual predictors of a multiple linear model, with the corresponding estimate, standard error, t-statistics, p-value.

## Installation

To install the package, run the following in R:

```r
# Install devtools if not already installed
install.packages("devtools")

# Get permission by this token
Sys.setenv(GITHUB_PAT = "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")

# Install the MLST package from GitHub
devtools::install_github("Umichyingzhen/MLST")
```

## Usage

Run these functions to get the test results or statistics of interest

```r
library(MLST)

# simulated dataset
set.seed(123)
simulate_data <- data.frame(
  normal = rnorm(100, mean = 10, sd = 5),
  X1 = rnorm(100),
  X2 = rnorm(100),
  X3 = rnorm(100)
)

# Set up the predictors and dependent variable
Predictors <- as.matrix(simulate_data[, c("X1", "X2")])
Y <- as.matrix(simulate_data[, "normal"])

# Get the results
RSE_result <- RSE(Y, Predictors, simulate_data)

Rsquared_result <- Rsquared(Y, Predictors, simulate_data)
print(Rsquared_result)

ADJRS_result <- ADJRS(Y, Predictors, simulate_data)
print(ADJRS_result)

Ftest_result <- Ftest(Y, Predictors, simulate_data)
print(Ftest_result)

Ttest_result <- Ttest(Y, Predictors, simulate_data)
print(Ttest_result)
```

## Functions

### `RSE(Y, Predictors, data)`
- **Description**: Computes the residual standard error.
- **Inputs**:
  - `Y`: The response variable (a numeric vector).
  - `Predictors`: A matrix of predictor variables.
  - `data`: A data frame containing the variables in the model.
- **Returns**: Residual standard error as a numeric value.

---

### `Rsquared(Y, Predictors, data)`
- **Description**: Calculates \( R^2 \), the coefficient of determination.
- **Inputs**:
  - `Y`: The response variable (a numeric vector).
  - `Predictors`: A matrix of predictor variables.
  - `data`: A data frame containing the variables in the model.
- **Returns**: \( R^2 \) value as a numeric value.

---

### `ADJRS(Y, Predictors, data)`
- **Description**: Computes the adjusted \( R^2 \), accounting for the number of predictors in the model.
- **Inputs**:
  - `Y`: The response variable (a numeric vector).
  - `Predictors`: A matrix of predictor variables.
  - `data`: A data frame containing the variables in the model.
- **Returns**: Adjusted \( R^2 \) value as a numeric value.

---

### `Ftest(Y, Predictors, data)`
- **Description**: Perform the F-test.
- **Inputs**:
  - `Y`: The response variable (a numeric vector).
  - `Predictors`: A matrix of predictor variables.
  - `data`: A data frame containing the variables in the model.
- **Returns**: A data frame consists of F-statistics, p-value, df1, and df2.

---

### `Ttest(Y, Predictors, data)`
- **Description**: Perform the T-test.
- **Inputs**:
  - `Y`: The response variable (a numeric vector).
  - `Predictors`: A matrix of predictor variables.
  - `data`: A data frame containing the variables in the model.
- **Returns**: A matrix consists of each predictors of interest with their estimate, standard error, t-value, and p-value.