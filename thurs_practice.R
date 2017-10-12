library(tidyverse) # run just this line (ctrl-Enter)

# import the data file and assign it to an object called survey. Use the read_csv function.

survey <- read_csv("class_survey.csv")

# What's the median population of the counties you all live in?

# (no code required) Why is there such a big difference between the mean and the median?

# How many of you discuss politics with your closest contacts almost all of the time or most of the time? Use both the table and count functions.

# Create a new variable that gives you the percent of people you all talk politics with who have a similar political affiliation. Use mutate. Be sure to overwrite the dataframe. I've started it for you.

survey <- survey %>%
  mutate()

# Create a table that shows the percent of people who wrote to Congress by how interested they are in politics. Use group_by, then summarize.

# What is the mean political heterogeneity index (2000-2016) (variable name is phi_00_16) broken down by whether someone thinks other people are generally trustworthy? Use group_by and summarize.

# What is the mean political heterogeneity index (2000-2016) (variable name is phi_00_16) broken down by whether someone thinks voting is a duty or a choice (variable name is duty_choice)? Use group_by and summarize.

# plot a bar graph of political interest

# draw a density plot of the average commute of all the counties

# plot a two-way chart of political interest and contribution (variable name is contrib)

# draw a boxplot of the relationship between duty_choice and phi_00_16

# draw something that plots the relationship between income inequality (gini) and phi_00_16

# Bonus: What is the political heterogeneity index (2000-2016) of counties that Trump won in 2016? What is it for counties that Clinton won?

# Bonus: Create a new variable that will tell you whether a county became more heterogenous or homogenous between 1980-1996 and 2000-2016. Be sure to overwrite the original dataframe or, if you prefer, save it as a new name.
# How many counties became more homogenous? How many became more heterogenous?

# Bonus: draw a boxplot of anything you're interested in, with a title and good labels

# Bonus: draw a scatterplot (showing points and a line) of something you're interested in, with a title and good labels