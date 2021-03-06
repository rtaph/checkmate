#' Check if an argument is a flag
#'
#' @description
#' A flag is defined as single logical value.
#'
#' @templateVar fn Flag
#' @template x
#' @template na-handling
#' @param na.ok [\code{logical(1)}]\cr
#'  Are missing values allowed? Default is \code{FALSE}.
#' @template checker
#' @family scalars
#' @useDynLib checkmate c_check_flag
#' @export
#' @examples
#' testFlag(TRUE)
#' testFlag(1)
checkFlag = function(x, na.ok = FALSE) {
  .Call("c_check_flag", x, na.ok, PACKAGE = "checkmate")
}

#' @rdname checkFlag
#' @useDynLib checkmate c_check_flag
#' @export
assertFlag = function(x, na.ok = FALSE, add = NULL, .var.name) {
  res = .Call("c_check_flag", x, na.ok, PACKAGE = "checkmate")
  makeAssertion(res, vname(x, .var.name), add)
}

#' @rdname checkFlag
#' @useDynLib checkmate c_check_flag
#' @export
testFlag = function(x, na.ok = FALSE) {
  res = .Call("c_check_flag", x, na.ok, PACKAGE = "checkmate")
  isTRUE(res)
}

#' @rdname checkFlag
#' @template expect
#' @useDynLib checkmate c_check_flag
#' @export
expect_flag = function(x, na.ok = FALSE, info = NULL, label = NULL) {
  res = .Call("c_check_flag", x, na.ok, PACKAGE = "checkmate")
  makeExpectation(res, info = info, label = vname(x, label))
}
