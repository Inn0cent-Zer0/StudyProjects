# Load the libraries
library(RCurl)

# Loading the DFHR data
dhfr <- read.csv(text = getURL("https://raw.githubusercontent.com/dataprofessor/data/master/dhfr.csv"))

# View(dhfr)

# Check for missing data
sum(is.na(dhfr))

# If data is clean, randomly introduce missing data to the data set
# The first argument is the data object and the second is the number of NAs to add to the data set
# We are going to add NA to the dhfr data object and 
# We are going to add 100 NA randomly into the dataset
# We are going to create a dataset which is not clean
na.gen <- function(data, n) {
  i <- 1
  while (i <= n) {
    # The first index will determine the row to randomly select
    # The second index will determine the column to randomly select 
    idx1 <- sample(1:nrow(data), 1)
    idx2 <- sample(1:ncol(data), 1)
    data[idx1, idx2] <- NA
    i <- i + 1
  }
  return(data)
}

# Before introducing NA to the dataset, leave the Y class label (output variable) out
dhfr_y <- dhfr[, 1]
dhfr <- dhfr[, -1]

# Choose 1 of the following to run (they'll produce the same result)
dhfr <- na.gen(dhfr, 100)
# dhfr <- na.gen(n=100, data=dhfr)

# Check again for missing data
sum(is.na(dhfr))

colSums(is.na(dhfr))

str(dhfr)

# Lists rows with missing data
missingdata <- dhfr[!complete.cases(dhfr), ]
View(missingdata)
sum(is.na(missingdata))

# If above sum is 0, this means that there is no missing data and proceed to modeling.
# If above sum is greater than 0, then proceed to #5

# Handling the missing data. There are 2 options, decide and choose only 1

# 5.1. Simply delete all entries with missing data
clean.data <- na.omit(dhfr)

sum(is.na(clean.data))

# 5.2. Imputation: Replace missing values with the column's

# MEAN
# Create a copy of the dhfr dataset to perform mean imputation
dhfr.impute <- dhfr

# Loop over each column in dhfr.impute that is numeric
for (i in which(sapply(dhfr.impute, is.numeric))) { 
  # Replace missing values in the ith column with the column's mean, ignoring NA values in the calculation
  dhfr.impute[is.na(dhfr.impute[, i]), i] <- mean(dhfr.impute[, i], na.rm = TRUE) 
}
sum(is.na(dhfr.impute))

# MEDIAN
dhfr.impute <- dhfr
# Loop over each column in dhfr.impute that is numeric
for (i in which(sapply(dhfr.impute, is.numeric))) { 
  # Replace missing values in the ith column with the column's median, ignoring NA values in the calculation
  dhfr.impute[is.na(dhfr.impute[, i]), i] <- median(dhfr.impute[, i], na.rm = TRUE) 
}
sum(is.na(dhfr.impute))
View(dhfr.impute)