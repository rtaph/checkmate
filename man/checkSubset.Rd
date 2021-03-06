% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/checkSubset.r
\name{checkSubset}
\alias{assertSubset}
\alias{checkSubset}
\alias{expect_subset}
\alias{testSubset}
\title{Check if object is a subset of a given set}
\usage{
checkSubset(x, choices, empty.ok = TRUE)

assertSubset(x, choices, empty.ok = TRUE, add = NULL, .var.name)

testSubset(x, choices, empty.ok = TRUE)

expect_subset(x, choices, empty.ok = TRUE, info = NULL, label = NULL)
}
\arguments{
\item{x}{[any]\cr
Object to check.}

\item{choices}{[\code{atomic}]\cr
Set of possible values.}

\item{empty.ok}{[\code{logical(1)}]\cr
Treat zero-length \code{x} as subset of any set \code{choices}?
Default is \code{TRUE}.}

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
 If the check is not successful, \code{assertSubset} throws an error message,
 \code{testSubset} returns \code{FALSE}, \code{checkSubset} returns
 a string with the error message. The function \code{expect_subset} will
 return an \code{\link[testthat]{expectation}}.
}
\description{
Check if object is a subset of a given set
}
\examples{
testSubset(c("a", "z"), letters)
testSubset("ab", letters)
testSubset("Species", names(iris))
}
\seealso{
Other set: \code{\link{assertChoice}},
  \code{\link{checkChoice}}, \code{\link{expect_choice}},
  \code{\link{testChoice}}; \code{\link{assertSetEqual}},
  \code{\link{checkSetEqual}},
  \code{\link{expect_set_equal}},
  \code{\link{testSetEqual}}
}

