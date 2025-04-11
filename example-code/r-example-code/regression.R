# Regression Example Code 

# This example code demonstrates three key applications of regression 
# in research assistant work:
#
# 1. A simple linear regression estimates the relationship between independent 
#    variables and a dependent variable by fitting a linear model to the 
#    observed data.
#
# 2. An intercept-only regression (regression on a single variable) computes 
#    the mean of the outcome variable and provides standard errors for 
#    hypothesis testing.
#
# 3. Calculating a linear combination of regression coefficients allows you to 
#    quantify the joint effect of multiple predictors, with standard errors 
#    that support formal statistical inference.

# Install fixedest package (if not installed already): 
install.packages("fixest")

# Load fixedest
library(fixest)

# Use the built-in mtcars dataset with mpg as the outcome variable.
# -----------------------------
# 1. Simple Linear Regression
# -----------------------------
# Regress mpg on wt (weight) and hp (horsepower)
model1 <- feols(mpg ~ wt + hp, data = mtcars)
summary(model1) # Displays regression results

# The 'estimate' column gives you the coefficient for each variable in the 
# regression equation.

# -----------------------------
# 2. Regression for a Summary Statistic of the Outcome
# -----------------------------

model2 <- feols(mpg ~ 1, data = mtcars)
summary(model2)

# The estimated intercept here is equal to the mean of mpg.
# The standard error of the intercept gives the SE of the mean, while the 
# t-value and p-value come from a hypothesis test of whether the mean is 
# singificantly different than zero. 

# -----------------------------
# 3. Linear Combination of Coefficients
# -----------------------------
# Often, we want to understand the combined effect of multiple predictors.
# For example, we might be interested in the net impact when the effect 
# of one predictor is scaled relative to another. Here, we calculate:
# L = (coefficient on wt) + 2*(coefficient on hp)
#
# This linear combination can help answer questions such as:
# "What is the expected change in mpg when we increase wt by one unit and hp by
# two units?" or test whether the joint effect of these changes is 
# statistically significant.

# Extract the coefficients from model1 (which includes the coefficients for both
# 'wt' and 'hp' obtained from the simple linear regression)
coefs <- coef(model1)

# Calculate the linear combination: coefficient on 'wt' + 2 * coefficient on 'hp'
lin_comb <- coefs["wt"] + 2 * coefs["hp"]
cat("Linear combination (wt + 2*hp):", lin_comb, "\n") # Print the result
