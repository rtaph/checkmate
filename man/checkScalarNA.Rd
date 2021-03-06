% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/checkScalarNA.r
\name{checkScalarNA}
\alias{assertScalarNA}
\alias{checkScalarNA}
\alias{expect_scalar_na}
\alias{testScalarNA}
\title{Check if an argument is a single missing value}
\usage{
checkScalarNA(x)

assertScalarNA(x, add = NULL, .var.name)

testScalarNA(x)

expect_scalar_na(x, info = NULL, label = NULL)
}
\arguments{
\item{x}{[any]\cr
Object to check.}

\item{add}{[\code{AssertCollection}]\cr
Collection to store assertions. See \code{\link{AssertCollection}}.}

\item{.var.name}{[character(1)]\cr
Name for \code{x}. Defaults to a heuristic to determine
the name using \code{\link[base]{deparse}} and \code{\link[base]{substitute}}.}

\item{info}{[character(1)]\cr
Extra information to be included in the message for the testthat reporter.
See \code{\link[testthat]{expect_that}}.}

\item{label}{[character(1)]\cr
Same as \code{.var.name}, but passed down to \code{\link[testthat]{expect_that}}.}
}
\value{
Depending on the function prefix:
 If the check is successful, all functions return \code{TRUE}.
 If the check is not successful, \code{assertScalarNA} throws an error message,
 \code{testScalarNA} returns \code{FALSE}, \code{checkScalarNA} returns
 a string with the error message. The function \code{expect_scalar_n_a} will
 return an \code{\link[testthat]{expectation}}.
}
\description{
Check if an argument is a single missing value
}
\examples{
testScalarNA(1)
testScalarNA(NA_real_)
testScalarNA(rep(NA, 2))
}
\seealso{
Other scalars: \code{\link{assertCount}},
  \code{\link{checkCount}}, \code{\link{expect_count}},
  \code{\link{testCount}}; \code{\link{assertFlag}},
  \code{\link{checkFlag}}, \code{\link{expect_flag}},
  \code{\link{testFlag}}; \code{\link{assertInt}},
  \code{\link{checkInt}}, \code{\link{expect_int}},
  \code{\link{testInt}}; \code{\link{assertNumber}},
  \code{\link{checkNumber}}, \code{\link{expect_number}},
  \code{\link{testNumber}}; \code{\link{assertPercentage}},
  \code{\link{checkPercentage}},
  \code{\link{expect_percentage}},
  \code{\link{testPercentage}}; \code{\link{assertScalar}},
  \code{\link{checkScalar}}, \code{\link{expect_scalar}},
  \code{\link{testScalar}}; \code{\link{assertString}},
  \code{\link{checkString}}, \code{\link{expect_string}},
  \code{\link{testString}}
}

