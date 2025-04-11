# This code goes over how to write functions that can be run as loops. 
# Functions are often used in larger projects to run multiple scripts in order
# or can be called (used) to make a repetitive data processing task more 
# efficient. This makes replication much easier. 

# Install and load tidyverse package (if not installed already):
install.packages("tidyverse")
library(tidyverse)

# Functions can be used to run two sets or arguments in parallel.

## Example: Attaching Year Information to a Dataset ##

# The following example attaches two columns of year data to a dataset.

# Define two sequences:
# - 'year_t_list' contains the current years (e.g., 2010, 2011, 2012)
# - 'year_tminus1_list' contains the corresponding previous years 
# (e.g., 2009, 2010, 2011)
year_t_list      <- 2010:2012       # Current year tags
year_tminus1_list <- 2009:2011      # Previous year tags

# Create an empty list to store the modified datasets
append_list <- list()

# Define a function that takes a current year (i) and a previous year (s),
# then attaches these as new columns to the dataset.
append_function <- function(i, s) {
  
  # Add the current year 'i' to a new column called 'year_t'
  dataset_in_loop$year_t <- i
  
  # Add the previous year 's' to a new column called 'year_tminus1'
  dataset_in_loop$year_tminus1 <- s
  
  # Append the modified dataset to the global list 'append_list'
  # The double arrow <<- is used to modify the 'append_list' outside the 
  # function's local scope.
  append_list[[i]] <<- dataset_in_loop
}

# Call the function to loop over the year sequences in parallel using mapply.
# For each pair (current year, previous year), the function 'append_function'
# is applied, creating a new, tagged version of the dataset.
mapply(i = year_t_list, s = year_tminus1_list, append_function)