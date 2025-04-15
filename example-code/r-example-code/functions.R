# This code goes over how to write functions that can be run as loops. 
# Functions are often used in larger projects to run multiple scripts in order
# or can be called (used) to make a repetitive data processing task more 
# efficient. This makes replication much easier. 

# Since functions vary so much in structure and purpose, this code provides
# an example of what building your own function might be useful for, rather
# than a template where you can plug values in to get the scenario-specific
# output you need. 

# Install and load tidyverse package (if not installed already):
install.packages("tidyverse")
library(tidyverse)

##### Create Sample Data #####
# This dataset includes example GDP and emissions data for the US. 
env_data <- data.frame(
  country   = rep("USA"),
  year      = rep(2010:2015),
  gdp       = c(15000, 15500, 16000, 17000, 21000, 22000),  # Example GDP values
  emissions = c(500, 480, 460, 600, 680, 760)             # Example emissions values
)

cat("Original environmental data:\n")
print(env_data)

##### Defining the Function #####
# Define a function to calculate emissions intensity and the year-to-year percent change.
calculate_intensity <- function(df) {
  # Ensure the data is sorted by 'year'
  df <- df %>% arrange(year)
  
  # Calculate emissions intensity, defined as emissions divided by GDP.
  df <- df %>% mutate(intensity = emissions / gdp)
  
  # Calculate the percentage change in intensity from the previous year.
  # lag(intensity) returns the intensity for the previous year within each group.
  df <- df %>% mutate(intensity_change = (intensity - lag(intensity)) / lag(intensity) * 100)
  
  return(df)
}

##### Call the Function #####
# Apply the calculate_intensity() function to perform the calculations 
# on the data, and store the new dataset as 'env_data_modified'. 
env_data_modified <- calculate_intensity(env_data)

# Check the modified data
cat("\nModified environmental data with intensity and percent change:\n")
print(env_data_modified)

# In the case of a single dataset, there's not really a huge advantage in using
# a function to perform these calculations vs. directly coding the operations
# into your data. However, functions tend to be really useful when you have to 
# repeat the task many times -- imagine a case where you have data for many 
# countries and wanted to repeat this calculation throughout your script. Then, 
# the function would make your code much more streamlined!

