#' Check if object is a subset of a given set
#'
#' @templateVar fn Subset
#' @template x
#' @param choices [\code{atomic}]\cr
#'  Set of possible values.
#' @param empty.ok [\code{logical(1)}]\cr
#'  Treat zero-length \code{x} as subset of any set \code{choices}?
#'  Default is \code{TRUE}.
#' @template checker
#' @family set
#' @export
#' @examples
#' testSubset(c("a", "z"), letters)
#' testSubset("ab", letters)
#' testSubset("Species", names(iris))
checkSubset = function(x, choices, empty.ok = TRUE) {
  qassert(choices, "a+")
  qassert(empty.ok, "B1")
  if (!empty.ok && length(x) == 0L)
    return("Empty set not allowed")
  if (any(x %nin% choices))
    return(sprintf("Must be a subset of {'%s'}", collapse(choices, "','")))
  return(TRUE)
}

#' @rdname checkSubset
#' @export
assertSubset = function(x, choices, empty.ok = TRUE, add = NULL, .var.name) {
  res = checkSubset(x, choices, empty.ok)
  makeAssertion(res, vname(x, .var.name), add)
}

#' @rdname checkSubset
#' @export
testSubset = function(x, choices, empty.ok = TRUE) {
  res = checkSubset(x, choices, empty.ok)
  isTRUE(res)
}

#' @rdname checkSubset
#' @template expect
#' @export
expect_subset = function(x, choices, empty.ok = TRUE, info = NULL, label = NULL) {
  res = checkSubset(x, choices, empty.ok)
  makeExpectation(res, info = info, label = vname(x, label))
}
