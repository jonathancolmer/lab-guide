# This file contains example code for creating histograms in R. Histograms are
# one of the easiest ways to visualize the distribution of a variable and 
# should be an instinctive early step in determining what is going on in 
# the data you're working with. 

# Install and load ggplot2 package if not already done
install.packages("ggplot2")
library(ggplot2)

# Load your data (replace the file path with the path to your own code)
data <- read.csv("path/to/your/data.csv")

# Create a histogram of 'variable' from the 'data' dataset
ggplot(data, aes(x = variable)) +
  geom_histogram(
    binwidth = 5,      # Set the width of each histogram bin to 5 units
    fill = "blue",     # Fill the bars with blue color
    color = "black"    # Outline the bars with black
  ) +
  labs(
    title = "Histogram of Variable",  # Title of the histogram
    x = "Value",                      # Label for the x-axis
    y = "Frequency"                   # Label for the y-axis
  )