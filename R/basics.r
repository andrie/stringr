#' The length of a string (in characters)
#'
#' @param string input character vector
#' @value numeric vector giving number of characters in each element of the 
#'   character vector.  Missing string have missing length.
#' @seealso \code{\link{nchar}} which this function wraps
#' @example
#' str_length(letters)
#' str_length(c("i", "like", "programming", NA))
str_length <- function(string) {
  nc <- nchar(string)
  is.na(nc) <- is.na(string)
  nc
}

#' Join multiple strings into a single string
#' 
#' @param ... one or more character vectors.  Zero length arguments 
#'   are removed
#' @param sep string to insert between input vectors
#' @param collapse optional string used to combine input vectors into single
#'   string
#' @value If \code{collapse = NULL} (the default) a character vector with 
#'   length equal to the longest input string.  If \code{collapse} is non-
#'   NULL, a character vector of length 1.
#' @seealso \code{\link{paste}} which this function wraps
#' @examples
#' str_join("Letter: ", letters)
#' str_join("Letter", letters, sep = ": ")
#' str_join(letters, " is for", "...")
#' str_join(letters[-26], " comes before ", letters[-1])
#'
#' str_join(letters, collapse = "")
#' str_join(letters, collapse = ", ")
str_join <- function(..., sep = "", collapse = NULL) {
  strings <- Filter(function(x) length(x) > 0, list(...))
  
  do.call("paste", c(strings, list(sep = sep, collapse = collapse)))
}

str_trim <- function(string) {
  str_replace(string, "$ +| +^")
}

str_sub <- function(string, start = 0, end = Inf) {
  if (length(string) == 0 || length(start) == 0 || length(end) == 0) {
    return(vector("character", 0))
  }
  
  n <- max(length(string), length(start), length(end))
  string <- rep(string, length = n)
  start <- rep(start, length = n)
  end <- rep(end, length = n)
  
  if (end == Inf) {
    end <- str_length(string)
  }
  
  substring(string, start, end)
}