#include "is_integerish.h"
#include <math.h>
#include <limits.h>

SEXP c_is_integerish(SEXP x, SEXP tolerance) {
    if (isInteger(x) || isLogical(x))
        return ScalarLogical(TRUE);
    if (! isReal(x))
        error("Only logical and numeric values supported");

    const double *xr = REAL(x);
    const double * const xend = xr + length(x);
    const double tol = REAL(tolerance)[0];

    for (; xr != xend; xr++) {
        if (!ISNAN(*xr) && (*xr <= INT_MIN || *xr > INT_MAX || fabs(*xr - nearbyint(*xr)) >= tol))
            return ScalarLogical(FALSE);
    }
    return ScalarLogical(TRUE);
}