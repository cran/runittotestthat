runittotestthat
===============

Convert `RUnit` tests to `testthat` tests.

### Installation

To install, you first need the devtools package.

```{r}
install.packages("devtools")
```

Then you can install the runittotestthat package using

```{r}
library(devtools)
install_github("richierocks/runittotestthat")
```

### Converting tests

There are three functions of interest: 

1. `convert_test` converts an individual `RUnit` test to a call to a `testthat` 
test.

    ```{r}
    test_truth <- function()
    {
      x <- all(runif(10) > 0)
      checkTrue(x)
    }
    convert_test(test_truth)
    ## test_that("test_truth", {
    ##     x <- all(runif(10) > 0)
    ##     expect_true(x)
    ## })
    
    test_equality <- function()
    {
      x <- sqrt(1:5)
      expected <- c(1, 4, 9, 16, 25)
      checkEquals(expected, x ^ 4)
    }
    convert_test(test_equality)
    ## test_that("test_equality", {
    ##     x <- sqrt(1:5)
    ##     expected <- c(1, 4, 9, 16, 25)
    ##     expect_equal(x^4, expected)
    ## })
    
    test_error <- function()
    {
      checkException("1" + "2")
    }
    convert_test(test_error)
    ## test_that("test_error", {
    ##     expect_error("1" + "2")
    ## })
    ```

2. `convert_test_file` sources all the tests in a file, converts each one, then
outputs them to a file (or file connection; `stdout` by default).

3. `convert_package_tests` takes a string naming a package, or a 
`devtools::package` object and loops over the files in `inst/tests` (or
wherever you specify), converting the tests, and outputting to files or `stdout`.
