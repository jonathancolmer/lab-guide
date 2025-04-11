# Bar graphs are a quick way to visualize totals across different groups. 
# In RA work, you might use them for a quick exploratory analysis of data
# for a brief, or you could invest significant time refining a bar graph into 
# a publication-quality descriptive figure.

# Install and load ggplot2 package if not already done
install.packages("ggplot2")
library(ggplot2)

# Generate fake dataset
data <- data.frame(
  category = c("A", "B", "C", "D"),  # Categories
  count    = c(10, 15, 7, 20)         # Corresponding counts
)

# Create a bar graph using ggplot2
ggplot(data, aes(x = category, y = count)) +
  geom_bar(stat = "identity", fill = "purple") +  # Draw purple bars
  labs(
    title = "Bar Graph",  # Add a title
    x = "Category",       # Label for x-axis
    y = "Count"           # Label for y-axis
  )

