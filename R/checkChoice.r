#' Check if an object is an element of a given set
#'
#' @templateVar fn Choice
#' @template checker
#' @param choices [\code{atomic}]\cr
#'  Set of possible values.
#' @family set
#' @export
#' @examples
#'  testChoice("x", letters)
checkChoice = function(x, choices) {
  qassert(choices, "a+")
  if (!qtest(x, "a1") || x %nin% choices)
    return(sprintf("Must be element of {'%s'}", collapse(choices, "','")))
  return(TRUE)
}

#' @rdname checkChoice
#' @export
assertChoice = function(x, choices, .var.name) {
  makeAssertion(checkChoice(x, choices), vname(x, .var.name))
}

#' @rdname checkChoice
#' @export
testChoice = function(x, choices) {
  isTRUE(checkChoice(x, choices))
}