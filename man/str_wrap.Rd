\name{str_wrap}
\alias{str_wrap}
\title{Wrap strings into nicely formatted paragraphs.}
\usage{str_wrap(string, width=80, indent=0, exdent=0)}

\description{
  Wrap strings into nicely formatted paragraphs.
}

\details{
  This is currently implemented as thin wrapper over
  \code{\link{strwrap}}, but is vectorised over
  \code{stringr}, and collapses output into single strings.
  See \code{\link{strwrap}} for more details.
}
\value{a character vector of reformatted strings.}
\arguments{
  \item{string}{character vector of strings to reformat.}
  \item{width}{positive integer giving target line width in characters.}
  \item{indent}{non-negative integer giving indentation of first line in 
each paragraph}
  \item{exdent}{non-negative integer giving indentation of following lines in 
each paragraph}
}
\examples{thanks <- str_c(readLines(R.home("doc/THANKS")), collapse = "\\n")
thanks <- word(thanks, 1, 3, fixed("\\n\\n"))
cat(str_wrap(thanks))}
