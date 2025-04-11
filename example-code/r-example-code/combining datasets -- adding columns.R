# This code demonstrates how to merge the columns from two datasets using 
# different methods. This is incredibly useful in data work - one might use 
# this code to attach GDP data to pollution data by country name or year, 
# or trade data to shipping data by product code. 


# Install and load tidyverse package (if not installed already):
install.packages("tidyverse")
library(tidyverse)

# Assume 'dataset1' and 'dataset2' are already available in your environment.

# 1. Merge two datasets (Inner Join) using base R merge()
#    This performs an inner join on the common column "keyvar". Only rows where 
#    the value of "keyvar" exists in both datasets are included in the result.
merged_inner_join <- merge(x = dataset1, y = dataset2, by = "keyvar")

# 2. Merge two datasets (Left Join) using base R merge()
#    This merges the datasets based on two key columns ("keyvar1" and "keyvar2").
#    The argument all.x = TRUE ensures that all rows from dataset1 are kept,
#    and only matching rows from dataset2 are added. If there is no match,
#    NA is filled.
merged_left_join <- merge(x = dataset1, y = dataset2, 
                          by = c("keyvar1", "keyvar2"), all.x = TRUE)


# 3. Merge two datasets (Left Join) using dplyr's left_join() (BEST METHOD)
#    This achieves the same result as the previous left join but preserves the 
#    left dataset's row order, offers a more intuitive syntax, and 
#    automatically distiguishes duplicate column names by adding suffixes.
left_joined <- left_join(x = dataset1, y = dataset2, by = c("keyvar1", "keyvar2"))

# 4. Combine datasets by columns using cbind()
#    If both datasets have their rows in the same order, you can attach their
#    columns side-by-side using cbind(). Note that cbind() does not check for 
#    matching key columns, so the datasets MUST already be in the same 
#    row order. 
columns_binded <- cbind(dataset1, dataset2)