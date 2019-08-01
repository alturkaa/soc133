# Data analysis assignment

# use tidyverse library
library(tidyverse)

# import your dataset
counties <- read_csv('full_data.csv')

# 1. How many counties in 1992 were won by at least 20 percentage points by either party? How many counties in 2016 were won by at least 20 percentage points by either party?

# R code below

# Answers: 

# 2. Focusing only on counties in NC, what was the average share of the population (by county) that works in manufacturing in 1992? (Use pop_16_over as your denominator when creating a new variable.) What was the average in 2016? Write the code that would produce two scatter plots (one for each year) that show the relationship between the manufacturing share and the share of Democratic votes.

# R code below

# Answers: 

# 3. Is there a relationship between a county's unemployment rate (use pop_16_over as the denominator when you create a new variable) and how it votes (use share of Democratic or share of Republican votes)? Write the code that would produce two scatter plots for two different years. 

# R code below

# Answers: 

# 4. What was the average voter turnout (for all counties) for each of the elections? Is there a relationship between a county's education level (use bach_more as the numerator and pop_25_over as the denominator) and its voter turnout? Write the code that would produce two scatter plots for 1992 and 2016 to show this.

# R code below

# Answers: 

# Bonus (that would add up to 1.5 percentage points to your full course grade). a) Is the effect of education on voter turnout, controlling for median income, stronger in Republican or Democratic counties (called the party variable in the dataset)? b) Is the effect of median income on voter turnout, controlling for education, stronger in Republican or Democratic counties? Assess this with a linear regression model, which you'll probably have to Google to figure out (hint: use the lm function in R).