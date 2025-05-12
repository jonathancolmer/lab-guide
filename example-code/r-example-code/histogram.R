 n# This file contains example code for creating histograms in R. Histograms are
# one of the easiest ways to visualize the distribution of a variable and 
# should be an instinctive early step in determining what is going on in 
# the data you're working with. 

# Install and load ggplot2 package if not already done
install.packages("ggplot2")
library(ggplot2)

# Load your data (replace the file path with the path to your own code)
data <- iris

# Create a histogram of 'variable' from the 'data' dataset
ggplot(iris, aes(x = Petal.Length)) +
  geom_histogram(
    binwidth = 0.3,        # Sets the range for each bin
    fill     = "skyblue",  # nice blue fill
    color    = "black"     # black outlines
  ) +
  labs(
    title = "Distribution of Iris Petal Length",
    x     = "Petal Length (cm)",
    y     = "Count"
  ) +
  theme_minimal()          # clean, minimal theme
