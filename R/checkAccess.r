#' Check file system access rights
#'
#' @templateVar fn Access
#' @template checker
#' @param access [\code{character(1)}]\cr
#'  Single string containing possible characters \sQuote{r}, \sQuote{w} and \sQuote{x} to
#'  force a check for read, write and execute access rights, respectively.
#' @family filesystem
#' @export
#' @examples
#'  # Is R's home directory readable?
#'  testAccess(R.home(), "r")
#'
#'  # Is R's home directory writeable?
#'  testAccess(R.home(), "w")
checkAccess = function(x, access = "") {
  qassert(access, "S1")
  if (nzchar(access)) {
    access = match(strsplit(access, "")[[1L]], c("r", "w", "x"))
    if (anyMissing(access) || anyDuplicated(access) > 0L)
      stop("Access pattern invalid, allowed are 'r', 'w' and 'x'")

    if (1L %in% access) {
      w = wf(file.access(x, 4L) != 0L)
      if (length(w) > 0L)
        return(sprintf("'%s' not readable", x[w]))
    }
    if (2L %in% access) {
      w = wf(file.access(x, 2L) != 0L)
      if (length(w) > 0L)
        return(sprintf("'%s' not writeable", x[w]))
    }
    if (3L %in% access) {
      w = wf(file.access(x, 1L) != 0L)
      if (length(w) > 0L)
        return(sprintf("'%s' not executeable", x[w]))
    }
  }
  return(TRUE)
}

#' @rdname checkAccess
#' @export
assertAccess = function(x, access = "", .var.name) {
  makeAssertion(checkAccess(x, access), vname(x, .var.name))
}

#' @rdname checkAccess
#' @export
testAccess = function(x, access = "") {
  isTRUE(checkAccess(x, access))
}