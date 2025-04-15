# This file contains example code for setting a working directory in R. Since
# almost all the code you write in this lab will be run by another person 
# at some point, it is easiest for everyone if the working directory 
# automatically changes when different users run the script. 

# The first part of this script demonstrates basic commands for working
# directories, and the second half provides a template to add to the preamble
# of your R scripts. 

## Preamble: Load Necessary Packages ##
install.packages("tidyverse")
library(tidyverse)

##### Part 1: Introduction to Working Directories #####

# Check the current working directory
current_dir <- getwd()
print(current_dir)  # Displays the current working directory

# Set the working directory to the folder that contains your data file
setwd("C:/Users/kwv4pt/The Lab Dropbox/Kate Bachman/EPA_pollution_figures/Data/Raw Data")

# Now, you can upload the file by specifying only the file name
data <- read_csv("naaqs-concentrations-data_co.csv")
# This is equivalent to the full path:
# data <- read_csv("C:/Users/kwv4pt/The Lab Dropbox/Kate Bachman/
# EPA_pollution_figures/Data/Raw Data/naaqs-concentrations-data_co.csv")


##### Part 2: Template for Setting Working Directories #####

# Retrieve the current system username
username <- Sys.info()[["user"]]

# Set the main directory according to the username.
# Update the cases below with your own paths for each project. 
main_dir <- switch(username,
                   "kwv4pt" = "C:/Users/kwv4pt/The Lab Dropbox/Kate Bachman", # Mine, for example
                   "user1"  = "/Path/To/Your/Main_Directory/for_User1/",  # Insert new username and file path here
                   "user2"  = "/Path/To/Your/Main_Directory/for_User2/",  # Insert new username and file path here
                   
                   # If your username is not listed above, the following prompt will show:
                   {
                     warning("Unknown user. Please set the main directory manually.") 
                     readline(prompt = "Enter the main directory path: ")
                   }
)


# For larger projects that require multiple scripts to be run, it is best 
# practice to automate the setting of the code directory too. 

# Set the code directory to the folder containing your scripts
code_dir <- switch(username,
                   "kwv4pt" = "C:/Users/kwv4pt/The Lab Dropbox/Kate Bachman/Mozambique Carbon Tax/Code",
                   "user2" = "/Path/To/Your/Code_Directory/for_User2/", 
                   {
                     warning("Unknown user. Please set the code directory manually.")
                     readline(prompt = "Enter the code directory path: ")
                   }
)

# Set the working directory to the main directory.
setwd(main_dir) # Can switch this with code_dir to set the coding directory
cat("Working directory set to:", getwd(), "\n")
