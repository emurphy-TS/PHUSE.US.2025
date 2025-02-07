test_that("Addition works for positive numbers", {
  app <- AppDriver$new(variant = platform_variant(), name = "addition_test")
  app$set_inputs(num1 = 3, num2 = 5)
  app$click("add_btn")
  expect_equal(app$get_value(output = "sum"), "8")
  app$stop()
})

test_that("Addition works for negative numbers", {
  app <- AppDriver$new(variant = platform_variant(), name = "negative_numbers_test")
  app$set_inputs(num1 = -3, num2 = -7)
  app$click("add_btn")
  expect_equal(app$get_value(output = "sum"), "-10")
  app$stop()
})

test_that("Addition works when one number is zero", {
  app <- AppDriver$new(variant = platform_variant(), name = "zero_test")
  app$set_inputs(num1 = 0, num2 = 10)
  app$click("add_btn")
  expect_equal(app$get_value(output = "sum"), "10")
  app$stop()
})

test_that("Addition works when both numbers are zero", {
  app <- AppDriver$new(variant = platform_variant(), name = "both_zero_test")
  app$set_inputs(num1 = 0, num2 = 0)
  app$click("add_btn")
  expect_equal(app$get_value(output = "sum"), "0")
  app$stop()
})

test_that("Addition works with decimal values", {
  app <- AppDriver$new(variant = platform_variant(), name = "decimal_test")
  app$set_inputs(num1 = 2.5, num2 = 3.5)
  app$click("add_btn")
  expect_equal(app$get_value(output = "sum"), "6")
  app$stop()
})

test_that("Addition works with large numbers", {
  app <- AppDriver$new(variant = platform_variant(), name = "large_numbers_test")
  app$set_inputs(num1 = 1e6, num2 = 2e6)
  app$click("add_btn")
  expect_equal(app$get_value(output = "sum"), "3000000")
  app$stop()
})

test_that("Addition works with negative and positive number", {
  app <- AppDriver$new(variant = platform_variant(), name = "mixed_sign_test")
  app$set_inputs(num1 = -5, num2 = 10)
  app$click("add_btn")
  expect_equal(app$get_value(output = "sum"), "5")
  app$stop()
})

test_that("Addition handles missing values correctly", {
  app <- AppDriver$new(variant = platform_variant(), name = "missing_value_test")
  app$set_inputs(num1 = NA, num2 = 5)
  app$click("add_btn")
  expect_equal(app$get_value(output = "sum"), "NA")
  app$stop()
})

test_that("Addition handles NULL values correctly", {
  app <- AppDriver$new(variant = platform_variant(), name = "null_value_test")
  app$set_inputs(num1 = NULL, num2 = 5)
  app$click("add_btn")
  expect_equal(app$get_value(output = "sum"), "NA")
  app$stop()
})

test_that("Addition handles non-numeric input correctly", {
  app <- AppDriver$new(variant = platform_variant(), name = "non_numeric_test")
  app$set_inputs(num1 = "abc", num2 = 5)
  app$click("add_btn")
  expect_equal(app$get_value(output = "sum"), "NA")
  app$stop()
})
