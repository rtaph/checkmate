#' Check argument inheritance
#'
#' @templateVar fn Class
#' @template x
#' @param classes [\code{character}]\cr
#'  Class names to check for inheritance with \code{\link[base]{inherits}}.
#' @param ordered [\code{logical(1)}]\cr
#'  Expect \code{x} to be specialized in provided order.
#'  Default is \code{FALSE}.
#' @template checker
#' @export
#' @examples
#' # Create an object with classes "foo" and "bar"
#' x = 1
#' class(x) = c("foo", "bar")
#'
#' # is x of class "foo"?
#' testClass(x, "foo")
#'
#' # is x of class "foo" and "bar"?
#' testClass(x, c("foo", "bar"))
#'
#' # is x most specialized as "bar"?
#' testClass(x, "bar", ordered = TRUE)
checkClass = function(x, classes, ordered = FALSE) {
  qassert(classes, "S")
  qassert(ordered, "B1")
  ord = inherits(x, classes, TRUE)
  w = wf(ord == 0L)

  if (length(w) > 0L) {
    cl = class(x)
    return(sprintf("Must have class '%s', but has class%s '%s'",
        classes[w], if (length(cl) > 1L) "es" else "", collapse(cl, "','")))
  }
  if (ordered) {
    w = wf(ord != seq_along(ord))
    if (length(w) > 0L) {
      cl = class(x)
      return(sprintf("Must have class '%s' in position %i, but has class%s '%s'",
        classes[w], w, if (length(cl) > 1L) "es" else "", collapse(cl, "','")))
    }
  }
  return(TRUE)
}

#' @rdname checkClass
#' @export
assertClass = function(x, classes, ordered = FALSE, add = NULL, .var.name) {
  res = checkClass(x, classes, ordered)
  makeAssertion(res, vname(x, .var.name), add)
}

#' @rdname checkClass
#' @export
testClass = function(x, classes, ordered = FALSE) {
  res = checkClass(x, classes, ordered)
  isTRUE(res)
}

#' @rdname checkClass
#' @template expect
#' @export
expect_class = function(x, classes, ordered = FALSE, info = NULL, label = NULL) {
  res = checkClass(x, classes, ordered)
  makeExpectation(res, info = info, label = vname(x, label))
}
