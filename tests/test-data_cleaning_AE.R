library(testthat)
library(tidyverse)
setwd("~/PHUSE.US.2025")
source("R/data_cleaning_AE.R")


test_that("data_cleaning_AE retains only required columns", {
  input_data <- data.frame(
    USUBJID = c("001", "002"),
    AEDECOD = c("Headache", "Nausea"),
    AESTDTC = c("2023-01-01", "2023-01-02"),
    AEENDTC = c("2023-01-03", NA),
    AESEV = c("Mild", "Severe"),
    AESER = c("No", "Yes"),
    AEREL = c("Unrelated", "Related"),
    EXTRA_COL = c("Extra", "Data") # Extra column to check filtering
  )
  cleaned_data <- data_cleaning_AE(input_data)
  
  # Check that only the required columns exist
  expected_columns <- c("USUBJID", "AEDECOD", "AESTDTC", "AEENDTC", "AESEV", "AESER", "AEREL", "ONGOING")
  expect_equal(colnames(cleaned_data), expected_columns)
  
})

test_that("data_cleaning_AE correctly derives ONGOING column", {
  input_data <- data.frame(
    USUBJID = c("001", "002"),
    AEDECOD = c("Headache", "Nausea"),
    AESTDTC = c("2023-01-01", "2023-01-02"),
    AEENDTC = c("2023-01-03", NA), # One missing AEENDTC
    AESEV = c("Mild", "Severe"),
    AESER = c("No", "Yes"),
    AEREL = c("Unrelated", "Related")
  )
  cleaned_data <- data_cleaning_AE(input_data)
  
  # Check that ONGOING is correctly derived
  expect_equal(cleaned_data$ONGOING, c("N", "Y"))
})


test_that("data_cleaning_AE throws error when required columns are missing", {
  input_data <- data.frame(
    USUBJID = c("001", "002"),
    AEDECOD = c("Headache", "Nausea"),
    AESTDTC = c("2023-01-01", "2023-01-02")
    # Missing AEENDTC, AESEV, AESER, AEREL
  )
  
  expect_error(data_cleaning_AE(input_data), 
               "The following required columns are missing: AEENDTC, AESEV, AESER, AEREL")
})
