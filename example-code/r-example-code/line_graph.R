# This file contains example code for creating a line graph. 
# Line graphs are useful for visualizing how a variable changes over time. 

# Install and load ggplot2 package if not already done
install.packages("ggplot2")
library(ggplot2)

# Load your dataset
data <- read.csv("path/to/your/dataset.csv")
# Make sure your dataset has at least two variables: 
# one for the x-axis (e.g., 'time') and one for the y-axis (e.g., 'value').


# Once your dataset is loaded, ensure that the column names in the 'aes()' 
# function below match those in your dataset.
# Modify the line graph code to reflect the actual names of these variables.

# Create a line graph using ggplot2 with your dataset
ggplot(data, aes(x = time, y = value)) +
  geom_line(color = "blue") +      # Draw a blue line connecting the data points
  labs(
    title = "Line Graph",           # Set the plot title
    x = "Time",                     # Label for the x-axis
    y = "Value"                     # Label for the y-axis
  )
