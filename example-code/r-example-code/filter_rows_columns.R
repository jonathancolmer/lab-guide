# This example code demonstrates how to filter rows and columns in a dataset. 
# This is incredibly useful in cleaning data -- removing irrelevant data 
# can make your dataset easier to understand and reduce proccessing time. 
# Note: You should replace column names ('variable1', 'variable2', etc.) 
# with names that match the dataset. 

# Install and load tidyverse package (if not installed already):
install.packages("tidyverse")
library(tidyverse)

# Load your dataset (we will use the built-in mtcars dataset as an example)
dataset <- mtcars

## FILTER ROWS ##

# This section demonstrates how to filter rows in a dataset based on 
# multiple criteria.
# The condition here is: 
#   Select rows where 'variable1' equals 2 AND 'variable3' does NOT equal 5,
#   OR where 'variable4' is missing (NA).

# Using dplyr (tidyverse approach):
# dplyr::filter() selects rows that meet the specified condition.
filtered_dataset_1 <- dataset %>%
  dplyr::filter(cyl == 6 & gear != 3 | is.na(carb) == TRUE)
print(filtered_dataset_1)

# Alternatively, using base R indexing:
# The dataset[...] syntax selects rows based on the logical condition provided.
# Here, the expression inside the square brackets returns TRUE if the
# criteria is met, and FALSE if the criteria is not, and keeps the row
# in the dataset only when the expression returns TRUE. 
filtered_dataset_2 <- dataset[
  (dataset$cyl == 6 & dataset$gear != 3) | 
    is.na(dataset$carb) == TRUE, 
]
print(filtered_dataset_2)

## FILTER COLUMNS ##

# Keep only variables variable1 and variable2

# With dplyr
col_filtered_dataset1 <- dataset%>%
  dplyr::select(mpg, wt)
print(col_filtered_dataset1)

# With conventional code
col_filtered_dataset2 <- dataset[, c("mpg", "wt")]
print(col_filtered_dataset2)

# Alternatively, you can select to keep columns by their number
# This code keeps column numbers 1 and 2 
# The colon means "through"
col_filtered_dataset3 <- dataset[, 1:2]
print(col_filtered_dataset3)

