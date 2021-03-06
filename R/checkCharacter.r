#' Check if an argument is a vector of type character
#'
#' @templateVar fn Character
#' @template x
#' @template na-handling
#' @inheritParams checkVector
#' @param pattern [\code{character(1L)}]\cr
#'  Regular expression as used in \code{\link[base]{grepl}}.
#'  All elements of \code{x} must comply to this pattern.
#'  Defaults to \code{NULL}.
#' @param ignore.case [\code{logical(1)}]\cr
#'  See \code{\link[base]{grepl}}. Default is \code{FALSE}.
#' @param fixed [\code{logical(1)}]\cr
#'  See \code{\link[base]{grepl}}. Default is \code{FALSE}.
#' @param min.chars [\code{integer(1)}]\cr
#'  Minimum number of characters in each element of \code{x}.
#' @template checker
#' @family basetypes
#' @useDynLib checkmate c_check_character
#' @export
#' @examples
#' testCharacter(letters, min.len = 1, any.missing = FALSE)
#' testCharacter(letters, min.chars = 2)
#' testCharacter("example", pattern = "xa")
checkCharacter = function(x, min.chars = NULL, pattern = NULL, fixed = FALSE, ignore.case = FALSE, any.missing = TRUE, all.missing = TRUE, len = NULL, min.len = NULL, max.len = NULL,  unique = FALSE, names = NULL) {
  .Call("c_check_character", x, min.chars, any.missing, all.missing, len, min.len, max.len, unique, names, PACKAGE = "checkmate") %and%
  checkCharacterProps(x, pattern, fixed, ignore.case)
}

#' @rdname checkCharacter
#' @useDynLib checkmate c_check_character
#' @export
assertCharacter = function(x, min.chars = NULL, pattern = NULL, fixed = FALSE, ignore.case = FALSE, any.missing = TRUE, all.missing = TRUE, len = NULL, min.len = NULL, max.len = NULL,  unique = FALSE, names = NULL, add = NULL, .var.name) {
  {
    res = .Call("c_check_character", x, min.chars, any.missing, all.missing, len, min.len, max.len, unique, names, PACKAGE = "checkmate")
    makeAssertion(res, vname(x, .var.name), add)
  } %and% {
    res = checkCharacterProps(x, pattern, fixed, ignore.case)
    makeAssertion(res, vname(x, .var.name), add)
  }
}

#' @rdname checkCharacter
#' @useDynLib checkmate c_check_character
#' @export
testCharacter = function(x, min.chars = NULL, pattern = NULL, fixed = FALSE, ignore.case = FALSE, any.missing = TRUE, all.missing = TRUE, len = NULL, min.len = NULL, max.len = NULL,  unique = FALSE, names = NULL) {
  res = .Call("c_check_character", x, min.chars, any.missing, all.missing, len, min.len, max.len, unique, names, PACKAGE = "checkmate")
  isTRUE(res) && isTRUE(checkCharacterProps(x, pattern, fixed, ignore.case))
}

#' @rdname checkCharacter
#' @template expect
#' @useDynLib checkmate c_check_character
#' @export
expect_character = function(x, min.chars = NULL, pattern = NULL, fixed = FALSE, ignore.case = FALSE, any.missing = TRUE, all.missing = TRUE, len = NULL, min.len = NULL, max.len = NULL,  unique = FALSE, names = NULL, info = NULL, label = NULL) {
  res = .Call("c_check_character", x, min.chars, any.missing, all.missing, len, min.len, max.len, unique, names, PACKAGE = "checkmate") %and% checkCharacterProps(x, pattern, fixed, ignore.case)
  makeExpectation(res, info = info, label = vname(x, label))
}

checkCharacterProps = function(x, pattern = NULL, fixed = FALSE, ignore.case = FALSE) {
  if (!is.null(pattern)) {
    qassert(pattern, "S1")
    qassert(fixed, "B1")
    qassert(ignore.case, "B1")
    ok = grepl(pattern, x, fixed = fixed, ignore.case = ignore.case)
    if(!all(ok))
      return(sprintf("Must comply to pattern '%s", pattern))
  }
  return(TRUE)
}
