\name{Ftest}
\alias{Ftest}
\title{Ftest}
\usage{
Ftest(Y, Predictors, data)
}
\arguments{\item{Y}{the matrix of dependent variable of interest from the dataset}
           \item{Predictors}{the matrix of predictors of interest from the dataset}
           \item{data}{the dataset of interest in data.frame format}
           }
\value{
The F-statistic and the corresponding p-value with the first degrees of freedom and the second degrees of freedom of a linear model.
}
\description{
Performs the F-test for a linear model to test whether the null hypothesis that none of the predictors has a statistically significant association with the dependent variable.
}
\examples{
Ftest(Y = as.matrix(simulate_data[, "outcome_name"]), Predictors = as.matrix(simulate_data[, c("predictor_name1", "predictor_name2")]), data = simulate_data)
}
