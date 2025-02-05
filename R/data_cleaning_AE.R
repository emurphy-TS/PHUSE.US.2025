# Filter to only necessary columns
data_cleaning_AE <- function(ae) {
  required_columns <- c(
    "USUBJID",
    "AEDECOD",
    "AESTDTC",
    "AEENDTC",
    "AESEV",
    "AESER",
    "AEREL"
  )
  
  # Ensure all required columns exist in the input data frame
  missing_columns <- setdiff(required_columns, colnames(ae))
  if (length(missing_columns) > 0) {
    stop(paste("The following required columns are missing:", paste(missing_columns, collapse = ", ")))
  }
  
  # Filter to only the necessary columns
  ae %>% select(all_of(required_columns)) %>%
    
    #derive ongoing column
    mutate(ONGOING = ifelse(is.na(AEENDTC), "Y","N"))
}
