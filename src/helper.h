#ifndef CHECKMATE_HELPER_H_
#define CHECKMATE_HELPER_H_

#include <R.h>
#define USE_RINTERNALS
#include <Rinternals.h>

Rboolean isStrictlyNumeric(SEXP);
Rboolean isRList(SEXP);
R_len_t get_ncols(SEXP);
R_len_t get_nrows(SEXP);
double asNumber(SEXP, const char *);
const char * asString(SEXP, const char *);
R_xlen_t asCount(SEXP, const char *);
Rboolean asFlag(SEXP, const char *);

#endif
