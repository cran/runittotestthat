% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/runittotestthat-package.R
\docType{package}
\name{runittotestthat}
\alias{runittotestthat}
\alias{runittotestthat-package}
\title{Convert RUnit tests to testthat tests.}
\description{
\code{testthat} has some nice features like test caching that aren't
suppported by \code{RUnit}.  This package lets you automatically convert your
existing \code{RUnit} tests to \code{testthat} tests.
}
\details{
There are three functions of interest:
\enumerate{
\item \code{\link{convert_test}} converts an individual \code{RUnit} test to
a call to a \code{testthat} test.
\item  \code{\link{convert_test_file}} sources all the tests in a file,
converts each one, then outputs them to a file (or file connection;
\code{\link[base]{stdout}} by default).
\item \code{\link{convert_package_tests}} takes a string naming a package, or
a \code{devtools::package} object and loops over the files in `inst/tests`
(or wherever you specify), converting the tests, and outputting to files or
\code{\link[base]{stdout}}.
}
}
\keyword{utilities}

