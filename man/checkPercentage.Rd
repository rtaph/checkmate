% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/checkPercentage.r
\name{checkPercentage}
\alias{assertPercentage}
\alias{checkPercentage}
\alias{expect_percentage}
\alias{testPercentage}
\title{Check if an argument is a percentage}
\usage{
checkPercentage(x, na.ok = FALSE)

assertPercentage(x, na.ok = FALSE, add = NULL, .var.name)

testPercentage(x, na.ok = FALSE)

expect_percentage(x, na.ok = FALSE, info = NULL, label = NULL)
}
\arguments{
\item{x}{[any]\cr
Object to check.}

\item{na.ok}{[\code{logical(1)}]\cr
Are missing values allowed? Default is \code{FALSE}.}

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
 If the check is not successful, \code{assertPercentage} throws an error message,
 \code{testPercentage} returns \code{FALSE}, \code{checkPercentage} returns
 a string with the error message. The function \code{expect_percentage} will
 return an \code{\link[testthat]{expectation}}.
}
\description{
This checks \code{x} to be numeric and in the range \code{[0,1]}.
}
\details{
This function does not distinguish between
\code{NA}, \code{NA_integer_}, \code{NA_real_}, \code{NA_complex_}
\code{NA_character_} and \code{NaN}.
}
\examples{
testPercentage(0.5)
testPercentage(1)
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
  \code{\link{testNumber}}; \code{\link{assertScalarNA}},
  \code{\link{checkScalarNA}},
  \code{\link{expect_scalar_na}},
  \code{\link{testScalarNA}}; \code{\link{assertScalar}},
  \code{\link{checkScalar}}, \code{\link{expect_scalar}},
  \code{\link{testScalar}}; \code{\link{assertString}},
  \code{\link{checkString}}, \code{\link{expect_string}},
  \code{\link{testString}}
}

