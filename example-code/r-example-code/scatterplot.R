# This file contains example code for creating scatterplots in R.
# Scatterplots are a useful way to visualize the relationship between two 
# variables and the distribution of data.

# Install and load ggplot2 package if not already done
install.packages("ggplot2")
library(ggplot2)

# Load your data (replace the file path with the path to your own code)
data <- read.csv("path/to/your/data.csv")


# Create a scatterplot with a line of best fit using ggplot2
ggplot(data, aes(x = variable1, y = variable2)) +    # Map 'variable1' to x-axis and 'variable2' to y-axis
  geom_point(color = "red") +                        # Add red scatterplot points
  geom_smooth(method = "lm",                         # Overlay a linear model fit
              se = FALSE,                            # Do not display the confidence interval   
              color = "blue") +                      # Color the best-fit line blue
  labs(title = "Scatterplot with Line of Best Fit",  # Set the plot title
       x = "Variable 1",                             # Label for the x-axis
       y = "Variable 2")                             # Label for the y-axis

# Create scatterplot with a line of best fit and a 95% confidence interval
ggplot(data, aes(x = variable1, y = variable2)) +
  geom_point(color = "red") +                       # Scatterplot points in red
  geom_smooth(method = "lm",                        # Fit a linear model
              se = TRUE,                            # Display the confidence interval
              level = 0.95,                         # Set the confidence level to 95%
              color = "blue") +                     # Color the line of best fit blue
  labs(title = "Scatterplot with Line of Best Fit and 95% Confidence Interval",
       x = "Variable 1",
       y = "Variable 2")
