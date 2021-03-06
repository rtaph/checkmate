#' Check if an argument is a count
#'
#' @description
#' A count is defined as non-negative integerish value.
#'
#' @templateVar fn Count
#' @template x
#' @template na-handling
#' @param na.ok [\code{logical(1)}]\cr
#'  Are missing values allowed? Default is \code{FALSE}.
#' @param positive [\code{logical(1)}]\cr
#'  Must \code{x} be positive (>= 1)?
#'  Default is \code{FALSE}, allowing 0.
#' @template tol
#' @template checker
#' @family scalars
#' @useDynLib checkmate c_check_count
#' @export
#' @examples
#' testCount(1)
#' testCount(-1)
checkCount = function(x, na.ok = FALSE, positive = FALSE, tol = sqrt(.Machine$double.eps)) {
  .Call("c_check_count", x, na.ok, positive, tol, PACKAGE = "checkmate")
}

#' @rdname checkCount
#' @useDynLib checkmate c_check_count
#' @export
assertCount = function(x, na.ok = FALSE, positive = FALSE, tol = sqrt(.Machine$double.eps), add = NULL, .var.name) {
  res = .Call("c_check_count", x, na.ok, positive, tol, PACKAGE = "checkmate")
  makeAssertion(res, vname(x, .var.name), add)
}

#' @rdname checkCount
#' @useDynLib checkmate c_check_count
#' @export
testCount = function(x, na.ok = FALSE, positive = FALSE, tol = sqrt(.Machine$double.eps)) {
  res = .Call("c_check_count", x, na.ok, positive, tol, PACKAGE = "checkmate")
  isTRUE(res)
}

#' @rdname checkCount
#' @template expect
#' @useDynLib checkmate c_check_count
#' @export
expect_count = function(x, na.ok = FALSE, positive = FALSE, tol = sqrt(.Machine$double.eps), info = NULL, label = NULL) {
  res = .Call("c_check_count", x, na.ok, positive, tol, PACKAGE = "checkmate")
  makeExpectation(res, info = info, label = vname(x, label))
}
