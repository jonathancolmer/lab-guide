# This code goes over how to write "for loops" and functions that can be run 
# as loops.

# Install and load tidyverse package (if not installed already):
install.packages("tidyverse")
library(tidyverse)


# For loops with numeric arguments 

for(i in 1:5){      # With each iteration, i = the next number in [1,5]
  
  # Prints numbers 1-5 on the screen
  print(i) 
}


# With character arguments
for(c in c("one", "two", "three")){
  
  # Prints the characters "one", "two" and "three" 
  print(c)
}


# Using character arguments based on a numeric argument

character_list <- c("one", "two", "three")
for(i in 1:length(character_list)){
  
  # Prints the ith item in "character_list", which ends up being "one" then 
  # "two" then "three". 
  print(character_list[i])
  
}