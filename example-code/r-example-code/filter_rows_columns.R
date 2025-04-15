# This example code demonstrates how to filter rows and columns in a dataset. 
# This is incredibly useful in cleaning data -- removing irrelevant data 
# can make your dataset easier to understand and reduce proccessing time. 
# Note: You should replace column names ('variable1', 'variable2', etc.) 
# with names that match the dataset. 

# Install and load tidyverse package (if not installed already):
install.packages("tidyverse")
library(tidyverse)

# Load your dataset
dataset <- read.csv("path/to/your/data/here")

## FILTER ROWS ##

# This section demonstrates how to filter rows in a dataset based on 
# multiple criteria.
# The condition here is: 
#   Select rows where 'variable1' equals 2 AND 'variable3' does NOT equal 5,
#   OR where 'variable4' is missing (NA).

# Using dplyr (tidyverse approach):
# dplyr::filter() selects rows that meet the specified condition.
dataset <- dataset %>%
  dplyr::filter(variable1 == 2 & variable3 != 5 | is.na(variable4) == TRUE)
print(dataset)

# Alternatively, using base R indexing:
# The dataset[...] syntax selects rows based on the logical condition provided.
# Here, the expression inside the square brackets returns TRUE if the
# criteria is met, and FALSE if the criteria is not, and keeps the row
# in the dataset only when the expression returns TRUE. 
dataset <- dataset[
  (dataset$variable1 == 2 & dataset$variable3 != 5) | 
    is.na(dataset$variable4) == TRUE, 
]
print(dataset)

## FILTER COLUMNS ##

# Keep only variables variable1 and variable2

# With dplyr
dataset <- dataset%>%
  dplyr::select(variable1, variable2)
print(dataset)

# With conventional code
dataset <- dataset[, c("variable1", "variable2")]
print(dataset)

# Alternatively, you can select to keep columns by their number
# This code keeps column numbers 1 and 2 
# The colon means "through"
dataset <- dataset[, 1:2]
print(dataset)

