library(tidyverse)

counties <- read_csv("full_data.csv")

dim(counties)

# look at the data
View(counties)

# check how many counties are in the dataset by year
table(counties$year)

### create new variables
### need to create variables that give you percentages rather than raw numbers

# voter turnout

# gop percent

# dem percent

# difference between the two (can you get the absolute value?)

# share of Hispanics

# share of non-Hispanic whites

# employment figures???

### create tables with group_by and summarize

# What's the average share of Hispanics (by county) over the years? 

# Has the share of whites with less than a HS degree gone down over the years? Show in a table.

### plot different relationships between variables

# plot relationship between pop density and party

# plot relationship between party and the following (share of whites, share of foreign-born, education, share of old people)