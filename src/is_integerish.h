#ifndef CHECKMATE_IS_INTEGERISH_H_
#define CHECKMATE_IS_INTEGERISH_H_

#include <R.h>
#define USE_RINTERNALS
#include <Rinternals.h>
#define INTEGERISH_DEFAULT_TOL sqrt(DOUBLE_EPS)

Rboolean isIntegerish(SEXP, double);
SEXP c_is_integerish(SEXP, SEXP);

#endif
