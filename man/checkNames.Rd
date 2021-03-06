% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/checkNames.r
\name{checkNames}
\alias{assertNames}
\alias{checkNames}
\alias{expect_names}
\alias{testNames}
\title{Check names to comply to specific rules}
\usage{
checkNames(x, type = "named")

assertNames(x, type = "named", add = NULL, .var.name)

testNames(x, type = "named")

expect_names(x, type = "named", info = NULL, label = NULL)
}
\arguments{
\item{x}{[\code{character} || \code{NULL}]\cr
Names to check using rules defined via \code{type}.}

\item{type}{[character(1)]\cr
Select the check(s) to perform.
\dQuote{unnamed} checks \code{x} to be \code{NULL}.
\dQuote{named} (default) checks \code{x} for reguluar names which excludes names to be \code{NA} or emtpy (\code{""}).
\dQuote{unique} additionally tests for non-duplicated names.
\dQuote{strict} checks for unique names which comply to R's variable name restrictions.
Note that you can use \code{\link{checkSubset}} to check for a specific set of names.}

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
 If the check is not successful, \code{assertNamed} throws an error message,
 \code{testNamed} returns \code{FALSE}, \code{checkNamed} returns
 a string with the error message. The function \code{expect_named} will
 return an \code{\link[testthat]{expectation}}.
}
\description{
Similar to \code{\link{checkNamed}} but you can pass the names directly.
}
\examples{
x = 1:3
testNames(x, "unnamed")
names(x) = letters[1:3]
testNames(x, "unique")
}

