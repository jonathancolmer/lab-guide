# This file contains example code for some of the basics of data manipulation
# in R. These tasks are a routine part of data cleaning, and using the dplyr
# package is typically the cleanest way to do them. 

# Install and load tidyverse package (if not installed already): 
install.packages("tidyverse")
library(tidyverse)

# Create a variable named "new_variable" that equals 1 in every row

#Conventional code
dataset$new_variable <- 1

#Dplyr code
dataset <- dataset %>%
  dplyr::mutate(new_variable=1)


# Convert from character-to-numeric and numeric-to-character
# Numeric variables are used for calculations, modeling, and quantitative 
# analysis. Character variables are used for labels, categories, and 
# qualitative information.
dataset <- dataset %>%
  dplyr::mutate(variable1_numeric = as.numeric(variable1),
                variable2_character = as.character(variable2))


# Extract a certain sequence of characters from a character string. This 
# extracts the characters from position 4 to position 8 of the complete 
# character string. 
dataset$character_snippet <- substr(dataset$character_complete, 4, 8)


# If/else statements
# "If both numeric1 and numeric2 are not missing, then calculate their 
# their difference and store it in the "difference" variable. Otherwise 
# store NA in the "difference" variable."
dataset <- dataset %>%
  dplyr::mutate(
    difference = ifelse(!is.na(numeric1) & !is.na(numeric2),
                        numeric1 - numeric2,   # Calculate the difference when both values exist.
                        NA)                    # Otherwise, assign NA.
  )


# Create a variable whose name and value depend on the loop argument 
# This can be helpful for reading or saving files in a folder. 
character_list <- c("one", "two", "three")
for(c in character_list){
  
  # Creates variables with names "variable_one", "variable_two", 
  # "variable_three" with values "one", "two", and "three"
  # Quotations do not show up in the cell values 
  dataset[[paste0("variable_", c)]] <- c  # Appends "variable_" and value in c
}