# This code demonstrates how to merge the columns from two datasets using 
# different methods. This is incredibly useful in data work - one might use 
# code like this to attach GDP data to pollution data by country name or year, 
# or trade data to shipping data by product code. 


# Install and load tidyverse package (if not installed already):
install.packages("tidyverse")
library(tidyverse)

# ───  Data preparation ────────────────────────────────────────────────────────

# 1. Create `mtcars_2` by taking the built-in `mtcars` and computing, for each 
#    engine size:
#    - avg_mpg: average miles per gallon
#    - avg_hp : average horsepower
#    - count  : number of cars in that group
#  The pipe (`%>%`) sends the output of one step into the next.
mtcars_2 <- mtcars %>%
  group_by(cyl) %>%                     # split rows by the 'cyl' column
  summarize(
    avg_mpg = mean(mpg),                # compute mean of mpg
    avg_hp  = mean(hp),                 # compute mean of hp
    count   = n(),                      # count rows in each group
    .groups = "drop"                    # drop grouping after summarizing
  )

# 2. Make a simple lookup table that matches each `cyl` value to a text label.
#    We use `tibble()` to create a small data frame by hand.
cyl_labels <- tibble(
  cyl       = c(4, 6, 8),
  cyl_label = c("Four Cylinder", "Six Cylinder", "Eight Cylinder")
)

# 3. Build a lookup of every (cyl, gear) combination and give it a label
cyl_gear_labels <- mtcars %>%
  distinct(cyl, gear) %>%              # find unique cyl/gear pairs
  mutate(
    cyl_gear_label = paste0(cyl, "-cyl / ", gear, "-gear") # make a text label
  )

# ─── 1. Inner join (base R) ───────────────────────────────────────────────────
# Use `merge()` to keep only rows where `cyl` appears in both tables.
baseR_inner_join <- merge(
  x  = mtcars_2,                        # left table
  y  = cyl_labels,                      # right table
  by = "cyl"                            # match rows based on this column
)
print(merged_inner_join)

# ─── 2. Left join (base R) ────────────────────────────────────────────────────
# Keeps every row from `mtcars_2`; adds `cyl_label` where it matches, if there 
# is no match, fills in NA. Add a second argument to join the data, matching
# rows where both cylinder and gear information match. 
baseR_left_join <- merge(
  x     = mtcars,
  y     = cyl_gear_labels,
  by    = c("cyl", "gear"),  # match rows on both cyl AND gear
  all.x = TRUE               # TRUE means “keep all rows from x”
)

# ─── 3. Left join (dplyr) ─────────────────────────────────────────────────────
# Performs the same left join but with clearer syntax and original row order:
dplyr_left_joined <- left_join(
  x  = mtcars,
  y  = cyl_gear_labels,
  by = "cyl", "gear"                          
)
print(left_joined)

# ─── 4. Column-bind (cbind) ───────────────────────────────────────────────────
# Cbind() only works if the data sets already have the same order.
# First, sort both by `cyl` to order rows from lowest to highest `cyl` value. 
mtcars_2_sorted   <- arrange(mtcars_2, cyl)
cyl_labels_sorted <- arrange(cyl_labels, cyl)

columns_binded <- cbind(
  mtcars_2_sorted,
  cyl_labels_sorted["cyl_label"]       # Select the column to add to mtcars_2
)
print(columns_binded)
