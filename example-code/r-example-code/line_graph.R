# This file contains example code for creating a line graph. 
# Line graphs are useful for visualizing how a variable changes over time. 

# Install and load ggplot2 package if not already done
install.packages("ggplot2")
library(ggplot2)

# Load your dataset
data <- iris
# Make sure your dataset has at least two variables: 
# one for the x-axis (e.g., 'time') and one for the y-axis (e.g., 'value').


# Once your dataset is loaded, ensure that the column names in the 'aes()' 
# function below match those in your dataset.
# Modify the line graph code to reflect the actual names of these variables.

# Create a line graph using ggplot2 with your dataset
ggplot(data, aes(x = Petal.Length, y = Petal.Width)) +
  geom_line(color = "black") +       # Draw a black line connecting the data 
  labs(
    title = "Petal Length vs. Width",          # Set the plot title
    x = "Petal Length (cm)",                   # Label for the x-axis
    y = "Petal Width (cm)"                     # Label for the y-axis
  )
