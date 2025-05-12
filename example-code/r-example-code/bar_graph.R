# Bar graphs are a quick way to visualize totals across different groups. 
# In RA work, you might use them for a quick exploratory analysis of data
# for a brief, or you could invest significant time refining a bar graph into 
# a publication-quality descriptive figure.

# Install and load ggplot2 package if not already done
install.packages("ggplot2")
library(ggplot2)

# Use the built-in mtcars dataset
data <- mtcars

# Create a summary count of how many cars have each number of cylinders
# Note: 'cyl' is numeric, so we convert it to a factor to treat it as a 
# categorical variable, then use table() to count how many times each category
# appears.
cyl_counts <- as.data.frame(table(factor(data$cyl)))

# Rename the columns for clarity
colnames(cyl_counts) <- c("cylinders", "count")

# Plot the summary table using ggplot
ggplot(cyl_counts, aes(x = cylinders, y = count)) +
  geom_bar(stat = "identity", fill = "blue") +  # Draw blue bars
  labs(
    title = "Number of Cars by Cylinder Count",  # Title of the plot
    x = "Number of Cylinders",                   # Label for x-axis
    y = "Count of Cars"                          # Label for y-axis
  )

