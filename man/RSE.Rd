\name{RSE}
\alias{RSE}
\title{RSE}
\usage{
RSE(Y, Predictors, data)
}
\arguments{\item{Y}{the matrix of dependent variable of interest from the dataset}
           \item{Predictors}{the matrix of predictors of interest from the dataset}
           \item{data}{the dataset of interest in data.frame format}
           }
\value{
The residual standard error of a linear model
}
\description{
Gets the residual standard error of a linear model with dependent variable Y and the matrix of predictors of interest from the dataset
}
\examples{
RSE(Y = as.matrix(simulate_data[, "outcome_name"]), Predictors = as.matrix(simulate_data[, c("predictor_name1", "predictor_name2")]), data = simulate_data)
}
