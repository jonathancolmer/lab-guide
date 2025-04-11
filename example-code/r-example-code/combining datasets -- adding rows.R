# This example code is a guide to combining datasets vertically; 
# stacking rows of datasets with the same columns and data types 
# on top of each other into one larger datset that can be used
# for analysis. The base R functions rbind() can only be used to 
# combine datasets with exactly the same column names and data 
# types. The tidyverse function bind_rows()  is simply better 
# in many ways -- it was designed to be more flexible and faster; 
# it will fill in missing columns with NA values instead of causing
# an error, and works much more smoothly with large datasets. 

# Install tidyverse package (if not installed already): 
packages.install("tidyverse")

# Load tidyverse
library(tidyverse)

# Example 1: Appending Two Datasets with rbind()

# Bind  2 rows of two datasets (dataset1 and dataset2) 
# with identical variable names using rbind()
appended_datasets <- rbind(dataset1, dataset2)


# Example 2: Appending Multiple Datasets Using a For Loop and bind_rows()
# This is generally the better method of combining datsets. This method
# stores the datasets in a list and appends them all at once. 

# Specify the path to the folder containing your dataset files.
# Replace "your/directory/path" with the actual path to the folder.
folder_path <- "your/directory/path"

# Get a list of all CSV files in the folder.
# pattern = "\\.csv$" ensures only CSV files are considered.
# full.names = TRUE returns the full file paths.
file_list <- list.files(path = folder_path, pattern = "\\.csv$", full.names = TRUE)

# NOTE:
# If your files are not in CSV format, adjust the pattern accordingly.
# For Excel files, consider using the readxl package and pattern = "\\.xlsx$" or "\\.xls$"

# Create an empty list to store the datasets.
dataset_list <- list()

# Loop over each file in the file_list using seq_along() to iterate by index.
for (i in seq_along(file_list)) {
  
  # Read the current CSV file into a data frame.
  # You can use read_csv() from tidyverse for fast reading of CSV files.
  dataset_list[[i]] <- read_csv(file_list[i])
  
  # Print a message indicating which file is read (this helps with debugging).
  cat("Loaded file", file_list[i], "into dataset_list at index", i, "\n")
}

# After the loop completes, dataset_list contains all datasets from the folder.
# You can now combine them into one single dataset if they have identical columns.
# This will stack the datasets row-wise.
dataset_appended <- bind_rows(dataset_list)

# Print the appended dataset to verify the result.
print(dataset_appended)