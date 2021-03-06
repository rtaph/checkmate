% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/checkArray.r
\name{checkArray}
\alias{assertArray}
\alias{checkArray}
\alias{expect_array}
\alias{testArray}
\title{Check if an argument is an array}
\usage{
checkArray(x, mode = NULL, any.missing = TRUE, d = NULL, min.d = NULL,
  max.d = NULL)

assertArray(x, mode = NULL, any.missing = TRUE, d = NULL, min.d = NULL,
  max.d = NULL, add = NULL, .var.name)

testArray(x, mode = NULL, any.missing = TRUE, d = NULL, min.d = NULL,
  max.d = NULL)

expect_array(x, mode = NULL, any.missing = TRUE, d = NULL, min.d = NULL,
  max.d = NULL, info = NULL, label = NULL)
}
\arguments{
\item{x}{[any]\cr
Object to check.}

\item{mode}{[\code{character(1)}]\cr
Storage mode of the array. Arrays can hold vectors, i.e. \dQuote{logical},
\dQuote{integer}, \dQuote{double}, \dQuote{numeric}, \dQuote{complex},
\dQuote{character} and \dQuote{list}. You can also specify \dQuote{atomic} here
to explicitly prohibit lists.
Default is \code{NULL} (no check).}

\item{any.missing}{[\code{logical(1)}]\cr
Are missing values allowed? Default is \code{TRUE}.}

\item{d}{[\code{integer(1)}]\cr
Exact dimensionality of array \code{x}.
Default is \code{NULL} (no check).}

\item{min.d}{[\code{integer(1)}]\cr
Minimum dimensionality of array \code{x}.
Default is \code{NULL} (no check).}

\item{max.d}{[\code{integer(1)}]\cr
Maximum dimensionality of array \code{x}.
Default is \code{NULL} (no check).}

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
 If the check is not successful, \code{assertArray} throws an error message,
 \code{testArray} returns \code{FALSE}, \code{checkArray} returns
 a string with the error message. The function \code{expect_array} will
 return an \code{\link[testthat]{expectation}}.
}
\description{
Check if an argument is an array
}
\examples{
checkArray(array(1:27, dim = c(3, 3, 3)), d = 3)
}
\seealso{
Other basetypes: \code{\link{assertAtomicVector}},
  \code{\link{checkAtomicVector}},
  \code{\link{expect_atomic_vector}},
  \code{\link{testAtomicVector}};
  \code{\link{assertAtomic}}, \code{\link{checkAtomic}},
  \code{\link{expect_atomic}}, \code{\link{testAtomic}};
  \code{\link{assertCharacter}},
  \code{\link{checkCharacter}},
  \code{\link{expect_character}},
  \code{\link{testCharacter}}; \code{\link{assertComplex}},
  \code{\link{checkComplex}}, \code{\link{expect_complex}},
  \code{\link{testComplex}}; \code{\link{assertDataFrame}},
  \code{\link{checkDataFrame}},
  \code{\link{expect_data_frame}},
  \code{\link{testDataFrame}};
  \code{\link{assertEnvironment}},
  \code{\link{checkEnvironment}},
  \code{\link{expect_environment}},
  \code{\link{testEnvironment}};
  \code{\link{assertFactor}}, \code{\link{checkFactor}},
  \code{\link{expect_factor}}, \code{\link{testFactor}};
  \code{\link{assertFunction}},
  \code{\link{checkFunction}},
  \code{\link{expect_function}},
  \code{\link{testFunction}};
  \code{\link{assertIntegerish}},
  \code{\link{checkIntegerish}},
  \code{\link{expect_integerish}},
  \code{\link{testIntegerish}};
  \code{\link{assertInteger}}, \code{\link{checkInteger}},
  \code{\link{expect_integer}}, \code{\link{testInteger}};
  \code{\link{assertList}}, \code{\link{checkList}},
  \code{\link{expect_list}}, \code{\link{testList}};
  \code{\link{assertLogical}}, \code{\link{checkLogical}},
  \code{\link{expect_logical}}, \code{\link{testLogical}};
  \code{\link{assertMatrix}}, \code{\link{checkMatrix}},
  \code{\link{expect_matrix}}, \code{\link{testMatrix}};
  \code{\link{assertNumeric}}, \code{\link{checkNumeric}},
  \code{\link{expect_numeric}}, \code{\link{testNumeric}};
  \code{\link{assertVector}}, \code{\link{checkVector}},
  \code{\link{expect_vector}}, \code{\link{testVector}}
}

