#' Check if an argument is vector of type integer
#'
#' @templateVar fn Integer
#' @template na-handling
#' @template checker
#' @inheritParams checkVector
#' @param lower [\code{numeric(1)}]\cr
#'  Lower value all elements of \code{x} must be greater than or equal.
#' @param upper [\code{numeric(1)}]\cr
#'  Upper value all elements of \code{x} must be lower than or equal.
#' @family basetypes
#' @seealso \code{\link{asInteger}}
#' @useDynLib checkmate c_check_integer
#' @export
#' @examples
#'  testInteger(1L)
#'  testInteger(1.)
#'  testInteger(1:2, lower = 1, upper = 2, any.missing = FALSE)
checkInteger = function(x, lower = -Inf, upper = Inf, any.missing = TRUE, all.missing = TRUE, len = NULL, min.len = NULL, max.len = NULL, unique = FALSE, names = NULL) {
  .Call("c_check_integer", x, lower, upper, any.missing, all.missing, len, min.len, max.len, unique, names, PACKAGE = "checkmate")
}

#' @rdname checkInteger
#' @useDynLib checkmate c_check_integer
#' @export
assertInteger = function(x, lower = -Inf, upper = Inf, any.missing = TRUE, all.missing = TRUE, len = NULL, min.len = NULL, max.len = NULL, unique = FALSE, names = NULL, .var.name) {
  makeAssertion(
    .Call("c_check_integer", x, lower, upper, any.missing, all.missing, len, min.len, max.len, unique, names, PACKAGE = "checkmate")
  , vname(x, .var.name))
}

#' @rdname checkInteger
#' @useDynLib checkmate c_check_integer
#' @export
testInteger = function(x, lower = -Inf, upper = Inf, any.missing = TRUE, all.missing = TRUE, len = NULL, min.len = NULL, max.len = NULL, unique = FALSE, names = NULL) {
  isTRUE(
    .Call("c_check_integer", x, lower, upper, any.missing, all.missing, len, min.len, max.len, unique, names, PACKAGE = "checkmate")
  )
}