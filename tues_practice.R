# Starting with line 16, I'd like you to fill in this file with R code (unless it says no code required).

# if you haven't installed this yet, uncomment line #2 and run
# install.packages("tidyverse")

# a package that is a set of really useful packages for data cleaning and visualization
library(tidyverse) # run just this line (ctrl-Enter)

?tidyverse # if this runs, your package has probably been installed and run correctly

# if you need help, type a ? then the name of the package or command
# ?tidyverse

# ?readr::read_csv

# assignment: assign some variable or object (or dataframe) to something on the right hand side. Use "<-"

# import the data file and assign it to an object called survey. Use the read_csv function.

# How many observations and variables are in the dataset? Use at least 2 different functions to find this out.

# What are the variable names?

# What's the average population of the counties you all live in?

# What's the median population of the counties you all live in?

# What's the maximum median household income in the dataset?

# (no code required) Why is there such a big difference between the average and the median?

# What's the minimum average commute?

# How many of you are either somewhat or very comfortable posting on social media? Use both the table and count functions.

# Create a new variable that gives you the percent of people you all talk politics with who have a similar political affiliation. Use mutate.

# Create a new dataframe that's just of people from North Carolina. How many of you are from NC?

# Create a table that shows the percent of people who protested broken down by how interested they are in politics. Use group_by, then summarize.

# Create a table that shows the percent of people who signed a petition by how interested they are in politics. Use group_by, then summarize.

# (no code required) Does there seem to be an interesting difference between these two tables? 

# Create a table that shows the percent of people who protested broken down by how comfortable they are posting on social media. Use group_by, then summarize.

# How many of you are from counties that went Democratic in the 2016 election?

# What's the average political heterogeneity index (1980-1996) of all the counties in dataset?

# What's the average political heterogeneity index (2000-2016) of all the counties in the dataset?

# What is the political heterogeneity index (2000-2016) of counties that Trump won in 2016? What is it for counties that Clinton won?

# Bonus: Create a new variable that will tell you whether a county became more heterogenous or homogenous between 1980-1996 and 2000-2016.
# How many counties became more homogenous? How many became more heterogenous?
