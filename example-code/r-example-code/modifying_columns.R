# This file contains example code for some of the basics of data manipulation
# in R. These tasks are a routine part of data cleaning, and using the dplyr
# package is typically the cleanest way to do them. 

# Install and load tidyverse package (if not installed already): 
install.packages("tidyverse")
library(tidyverse)

# Load data. This code uses the built-in dataset mtcars
dataset <- mtcars

# Create a variable named "new_variable" that equals 1 in every row

# Conventional code - creates the column "new_variable" and enters 1 every row
dataset$new_variable <- 1 
print(dataset)

#Dplyr code
dataset_2 <- dataset %>%
  dplyr::mutate(new_variable= "cool_cars") # if new_variable already exists, this overwrites it
print(dataset_2)


# Convert from character-to-numeric and numeric-to-character and store as new
# variables. Numeric variables are used for calculations, modeling, and 
# quantitative analysis. Character variables are used for labels, categories,
# and qualitative information.

# If you want to convert one type of data to another, use the as.numeric(),
# as.character() or similar commands. Insert the variable that you want to 
# change as the parameter, and the function will convert it to the data type
# specified in the function title. If the output variable has the same name as 
# the input variable, the original variable will be overwritten. 

dataset_3 <- dataset %>%
  dplyr::mutate(carb = as.character(carb))
print(dataset_3)


# Extract a certain sequence of characters from a character string and saves
# as a new column in the dataset. This code extracts the characters from 
# position 4 to position 8 of the complete character string. 
dataset_2$character_snippet <- substr(dataset_2$new_variable, 4, 8)
print(dataset_2)


# If/else statements
# "If both numeric1 and numeric2 are not missing, then calculate their 
# their difference and store it in the "difference" variable. Otherwise 
# store NA in the "difference" variable."
dataset_4 <- dataset %>%
  dplyr::mutate(
    difference = ifelse(!is.na(gear) & !is.na(am),
                        gear - am,   # Calculate the difference when both values exist.
                        NA)                    # Otherwise, assign NA.
  )

print(dataset_4)

# Create a variable whose name and value depend on the loop argument 
# This can be helpful for reading or saving files in a folder. 
character_list <- c("one", "two", "three")
for(c in character_list){
  
  # Creates variables with names "variable_one", "variable_two", 
  # "variable_three" with values "one", "two", and "three"
  # Quotations do not show up in the cell values 
  dataset[[paste0("variable_", c)]] <- c  # Appends "variable_" and value in c
}

print(dataset)

