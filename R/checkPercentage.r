#' Check if an argument is a percentage
#'
#' @description
#' This checks \code{x} to be numeric and in the range \code{[0,1]}.
#'
#' @templateVar fn Percentage
#' @template x
#' @template na-handling
#' @param na.ok [\code{logical(1)}]\cr
#'  Are missing values allowed? Default is \code{FALSE}.
#' @template checker
#' @family scalars
#' @useDynLib checkmate c_check_number
#' @export
#' @examples
#' testPercentage(0.5)
#' testPercentage(1)
checkPercentage = function(x, na.ok = FALSE) {
  .Call("c_check_number", x, na.ok, 0.0, 1.0, FALSE, PACKAGE = "checkmate")
}

#' @rdname checkPercentage
#' @useDynLib checkmate c_check_number
#' @export
assertPercentage = function(x, na.ok = FALSE, add = NULL, .var.name) {
  res = .Call("c_check_number", x, na.ok, 0.0, 1.0, FALSE, PACKAGE = "checkmate")
  makeAssertion(res, vname(x, .var.name), add)
}

#' @rdname checkPercentage
#' @useDynLib checkmate c_check_number
#' @export
testPercentage = function(x, na.ok = FALSE) {
  res = .Call("c_check_number", x, na.ok, 0.0, 1.0, FALSE, PACKAGE = "checkmate")
  isTRUE(res)
}

#' @rdname checkPercentage
#' @template expect
#' @useDynLib checkmate c_check_number
#' @export
expect_percentage = function(x, na.ok = FALSE, info = NULL, label = NULL) {
  res = .Call("c_check_number", x, na.ok, 0.0, 1.0, FALSE, PACKAGE = "checkmate")
  makeExpectation(res, info = info, label = vname(x, label))
}
