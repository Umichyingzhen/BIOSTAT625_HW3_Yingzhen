\name{Ttest}
\alias{Ttest}
\title{Ttest}
\usage{
Ttest(Y, Predictors, data)
}
\arguments{\item{Y}{the matrix of dependent variable of interest from the dataset}
           \item{Predictors}{the matrix of predictors of interest from the dataset}
           \item{data}{the dataset of interest in data.frame format}
           }
\value{
The estimates, standard errors, t values, p-values for each predictors including intercept of a linear model.
}
\description{
Performs the T-test for each predictor including intercept a linear model to test whether the null hypothesis that the predictor has a statistically significant association with the dependent variable.
}
\examples{
Ttest(Y = as.matrix(simulate_data[, "outcome_name"]), Predictors = as.matrix(simulate_data[, c("predictor_name1", "predictor_name2")]), data = simulate_data)
}
