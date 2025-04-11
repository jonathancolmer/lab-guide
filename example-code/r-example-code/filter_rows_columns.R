# This example code demonstrates how to filter rows and columns in a dataset. 
# This is incredibly useful in cleaning data -- removing irrelevant data 
# can make your dataset easier to understand and reduce proccessing time. 

# Install and load tidyverse package (if not installed already):
install.packages("tidyverse")
library(tidyverse)


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

# Alternatively, using base R indexing:
# The dataset[...] syntax selects rows based on the logical condition provided.
# Here, the expression inside the square brackets returns TRUE if the
# criteria is met, and FALSE if the criteria is not, and keeps the row
# in the dataset only when the expression returns TRUE. 
dataset <- dataset[
  (dataset$variable1 == 2 & dataset$variable3 != 5) | 
    is.na(dataset$variable4) == TRUE, 
]


## FILTER COLUMNS ##

# Keep only variables variable1 and variable2

# With dplyr
dataset <- dataset%>%
  dplyr::select(variable1, variable2)

# With conventional code
dataset <- dataset[, c("variable1", "variabl2")]

# Alternatively, if variable1 and variable2 are column numbers 1 and 2 
# The colon means "through"
dataset <- dataset[, 1:2]


