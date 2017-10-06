# if you haven't installed this yet, uncomment line #2 and run
# install.packages("tidyverse")

# basic calculations
2 + 3

# a package that is a set of really useful packages for data cleaning and visualization
library(tidyverse) # run just this line (ctrl-Enter)

# if you need help, type a ? then the name of the package or command
?tidyverse # if this runs, your package has probably been installed and run correctly

# get help about a function inside a package
# ?readr::read_csv

# assignment: assign some variable or object to something on the right hand side. Use "<-"
z <- 7 + 5
y <- 12 / 2

z / y

# import the data file and assign it to an object called survey
survey <- read_csv("class_survey.csv") # create a new object called survey that uses the function read_csv

?readr::read_csv # run this to get some info about the function read_csv. It's a lot of jargon!

# get the dimensions (# rows, # columns) of the dataframe
dim(survey)

# get column names of dataframe
names(survey)

# look at first six rows of the dataframe
head(survey)

# look at first 10 rows of the dataframe
head(survey, 10)

# summary statistics of all columns (variables) in dataframe
summary(survey)

# get the structure of the dataframe, with some useful info
str(survey)

# view dataframe
View(survey) # this does the same thing as clicking on survey under Environment on the right hand side of RStudio

# if you want to run a function on just one variable, you can use the following: 
# function(survey$variable_name)

# get count of all the different responses of a particular column (variable)
table(survey$talk_pol) # in the parentheses, type name of dataframe, then $, then the column name

# get counts of people's responses to how interested in politics they are
table(survey$pol_int)

# find count of social media comfort
table(survey$soc_media_comfort)

?table # get help on the function table

# get summary statistics of one variable
summary(survey$avg_commute)

# filter - filters out rows based on some condition you give it (in this case, rows where the pop variable is more than 250000)

survey %>%
  filter(pop > 250000)

# filter - filters out rows based on some condition you give it (in this case, rows where the vote variable is equal to "Yes")

survey %>%
  filter(vote == "Yes")

# filter, then count
survey %>%
  filter(soc_media_comfort == "Very comfortable" | soc_media_comfort == "Somewhat comfortable") %>%
  count(soc_media_comfort)

# mutate. First, test it out. Then, overwrite the original dataframe.

# mutate creates a new variable (in this case, I called it pct_workers)
survey %>%
  mutate(pct_workers = workers_outside_home / pop)

# how many posted on social media?

table(survey$post)

# group_by and summarize

# what's the percentage of people who posted on social media based on whether 
# they find people to be generally trustworthy?

survey %>%
  group_by(soc_trust) %>% # use group_by with the name of the variable you're interested in grouping by
  summarize(total = n(), # inside summarize, create two variables, one called total, which is equal to the total number by group...
            post_yes = mean(post == "Yes")) # and one called post_yes that's equal to the percent of people who posted on social media.

