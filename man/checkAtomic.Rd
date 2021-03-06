% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/checkAtomic.r
\name{checkAtomic}
\alias{assertAtomic}
\alias{checkAtomic}
\alias{expect_atomic}
\alias{testAtomic}
\title{Check that an argument is an atomic vector}
\usage{
checkAtomic(x, any.missing = TRUE, all.missing = TRUE, len = NULL,
  min.len = NULL, max.len = NULL, unique = FALSE, names = NULL)

assertAtomic(x, any.missing = TRUE, all.missing = TRUE, len = NULL,
  min.len = NULL, max.len = NULL, unique = FALSE, names = NULL,
  add = NULL, .var.name)

testAtomic(x, any.missing = TRUE, all.missing = TRUE, len = NULL,
  min.len = NULL, max.len = NULL, unique = FALSE, names = NULL)

expect_atomic(x, any.missing = TRUE, all.missing = TRUE, len = NULL,
  min.len = NULL, max.len = NULL, unique = FALSE, names = NULL,
  info = NULL, label = NULL)
}
\arguments{
\item{x}{[any]\cr
Object to check.}

\item{any.missing}{[\code{logical(1)}]\cr
Are vectors with missing values allowed? Default is \code{TRUE}.}

\item{all.missing}{[\code{logical(1)}]\cr
Are vectors with only missing values allowed? Default is \code{TRUE}.}

\item{len}{[\code{integer(1)}]\cr
Exact expected length of \code{x}.}

\item{min.len}{[\code{integer(1)}]\cr
Minimal length of \code{x}.}

\item{max.len}{[\code{integer(1)}]\cr
Maximal length of \code{x}.}

\item{unique}{[\code{logical(1)}]\cr
Must all values be unique? Default is \code{FALSE}.}

\item{names}{[\code{character(1)}]\cr
Check for names. See \code{\link{checkNamed}} for possible values.
Default is \dQuote{any} which performs no check at all.
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
 If the check is not successful, \code{assertAtmoic} throws an error message,
 \code{testAtmoic} returns \code{FALSE}, \code{checkAtmoic} returns
 a string with the error message. The function \code{expect_atmoic} will
 return an \code{\link[testthat]{expectation}}.
}
\description{
For the definition of \dQuote{atomic}, see \code{\link[base]{is.atomic}}.
}
\examples{
testAtomic(letters, min.len = 1L, any.missing = FALSE)
}
\seealso{
Other atomicvector: \code{\link{assertAtomicVector}},
  \code{\link{checkAtomicVector}},
  \code{\link{expect_atomic_vector}},
  \code{\link{testAtomicVector}};
  \code{\link{assertVector}}, \code{\link{checkVector}},
  \code{\link{expect_vector}}, \code{\link{testVector}}

Other basetypes: \code{\link{assertArray}},
  \code{\link{checkArray}}, \code{\link{expect_array}},
  \code{\link{testArray}};
  \code{\link{assertAtomicVector}},
  \code{\link{checkAtomicVector}},
  \code{\link{expect_atomic_vector}},
  \code{\link{testAtomicVector}};
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

Other basetypes: \code{\link{assertArray}},
  \code{\link{checkArray}}, \code{\link{expect_array}},
  \code{\link{testArray}};
  \code{\link{assertAtomicVector}},
  \code{\link{checkAtomicVector}},
  \code{\link{expect_atomic_vector}},
  \code{\link{testAtomicVector}};
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

