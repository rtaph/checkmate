context("checkDataFrame")

test_that("checkDataFrame", {
  myobj = iris
  expect_succ_all(DataFrame, myobj)
  myobj = TRUE
  expect_fail_all(DataFrame, myobj)

  expect_true(testDataFrame(data.frame()))
  expect_false(testDataFrame(NULL))
  expect_true(testDataFrame(data.frame(1)))
  expect_true(testDataFrame(iris))
  expect_false(testDataFrame(list(1)))

  x = iris
  expect_true(testDataFrame(x, types = c("numeric", "factor")))
  expect_false(testDataFrame(x, types = c("integer", "factor")))
  expect_false(testDataFrame(x, types = c("numeric", "character")))
  expect_true(testDataFrame(data.frame(), types = "NULL"))

  expect_true(testDataFrame(data.frame(), types = "numeric"))
  expect_error(assertDataFrame(1), "data.frame")
  expect_error(assertDataFrame(x, types = "numeric"), "types: numeric")

  # check nrow and ncol constraints
  expect_true(testDataFrame(x, nrows = 150L, ncols = 5L))
  expect_false(testDataFrame(x, nrows = 150L, ncols = 7L))
  expect_true(testDataFrame(x, min.rows = 2L, min.cols = 4L))
  expect_false(testDataFrame(x, min.rows = 151L, min.cols = 4L))
  expect_false(testDataFrame(x, min.rows = 1L, min.cols = 6L))
})


test_that("checkDataFrame name checking works", {
  df = data.frame(x = 1:2, y = 1:2)
  names(df) = c("x", "x")
  expect_true(assertDataFrame(df))
  expect_error(assertDataFrame(df, col.names = "unnamed"), "unnamed")

  names(df) = c("x", "")
  expect_error(assertDataFrame(df, col.names = "named"), "named")

  names(df) = c("x", "x")
  expect_true(assertDataFrame(df, col.names = "named"))
  expect_error(assertDataFrame(df, col.names = "unique"), "uniquely")
  expect_error(assertDataFrame(df, col.names = "strict"), "uniquely")
  expect_error(assertDataFrame(df, col.names = "foo"), "unnamed")

  names(df) = c("x", "1")
  expect_true(assertDataFrame(df, col.names = "named"))
  expect_true(assertDataFrame(df, col.names = "unique"))
  expect_error(assertDataFrame(df, col.names = "strict"), "naming rules")

  rownames(df) = NULL
  expect_error(assertDataFrame(df, row.names = "unnamed"), "unnamed")
  expect_true(assertDataFrame(df, row.names = "named"))
  expect_error(assertDataFrame(df, row.names = "strict"), "naming rules")
})

test_that("dimension checks work for empty frames", {
  x = iris[, -c(1:5)]
  expect_true(testDataFrame(x, min.rows = 5))
  expect_true(testDataFrame(x, nrows = 150))
  expect_false(testDataFrame(x, min.rows = 151))
  expect_false(testDataFrame(x, nrows = 1))

  x = iris[-c(1:150), ]
  expect_true(testDataFrame(x, min.cols = 1))
  expect_true(testDataFrame(x, ncols = 5))
  expect_false(testDataFrame(x, min.cols = 6))
  expect_false(testDataFrame(x, ncols = 1))
})

test_that("missing values are detected", {
  x = data.frame(a = 1:2, b = c(1, 2))
  expect_true(testDataFrame(x, any.missing = FALSE))
  expect_true(testDataFrame(x, all.missing = FALSE))
  x$b[1] = NA
  expect_false(testDataFrame(x, any.missing = FALSE))
  expect_true(testDataFrame(x, all.missing = FALSE))
  x$b[2] = NA
  expect_false(testDataFrame(x, any.missing = FALSE))
  expect_false(testDataFrame(x, all.missing = FALSE))
})

test_that("data.table is supported", {
  skip_if_not_installed("data.table")
  library(data.table)
  myobj = as.data.table(iris)
  expect_succ_all(DataFrame, myobj)
  expect_true(testDataFrame(myobj, nrow = 150, min.cols = 2, any.missing = FALSE, col.names = "strict"))
  expect_true(testDataFrame(data.table()))
})

test_that("dplyr::data_frame is supported", {
  skip_if_not_installed("dplyr")
  library(dplyr)
  myobj = as_data_frame(iris)
  expect_succ_all(DataFrame, myobj)
  expect_true(testDataFrame(myobj, nrow = 150, min.cols = 2, any.missing = FALSE, col.names = "strict"))
  expect_true(testDataFrame(data_frame()))
})
