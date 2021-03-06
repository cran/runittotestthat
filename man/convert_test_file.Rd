% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/convert.R
\name{convert_test_file}
\alias{convert_test_file}
\title{Convert a file worth of RUnit tests to testthat tests}
\usage{
convert_test_file(runit_file, test_func_regexp = "^test.+",
  testthat_file = stdout())
}
\arguments{
\item{runit_file}{A path to an file containing \code{RUnit} tests.}

\item{test_func_regexp}{Regular expression determining which functions in the
tests files are considered to be tests.}

\item{testthat_file}{String of path for the output file.
Defaults to \code{stdout()} to prevent you overwriting your existing test
files.  See note.}
}
\value{
A list of calls to \code{test_that} is invisibly returned.  This list
is also written to an output connection (defaulting to stdout).
An environment containing the original \code{RUnit} is stored in
\code{attr(, "runit_tests")}.
}
\description{
Converts all RUnit tests in a file to testthat tests, and writes them out
to another file.
}
\note{
\code{RUnit} tests will be evaluated when they are read in, so make
sure that all your tests pass before you convert them.

The \code{testthat_file} argument can be based upon the \code{runit_file}
argument.  For example, if you use the traditional \code{RUnit} test file
naming strategy, something like \code{sub("^runit", "testthat", runit_file)}
may be appropriate.
}
\examples{
tmp <- tempfile("test-convert_test_file")
writeLines(
  "test_truth <- function()
{
  x <- all(runif(10) > 0)
  checkTrue(x)
}
test_equality <- function()
{
  x <- sqrt(1:5)
  expected <- c(1, 4, 9, 16, 25)
  checkEquals(expected, x ^ 4)
}
test_error <- function()
{
  checkException('1' + '2')
}",
  tmp
)
convert_test_file(tmp)
unlink(tmp)
}
\seealso{
\code{\link{convert_package_tests}}, \code{\link{convert_test}}
}

