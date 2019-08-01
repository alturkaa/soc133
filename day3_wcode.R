# use the library tidyverse
library(tidyverse)

# import the .csv file and assign it to a name
survey <- read_csv('full_survey.csv')

# How many observations and variables are in the dataset? Aside from looking at it under Environment, can you find this out from a function?
dim(survey)

# What is the average political heterogeneity index of where people in the survey currently live? Use the curr_phi_00_16 variable.
summary(survey$curr_phi_00_16)

# What is the average political heterogeneity index of these same counties about 20 years ago? Use the curr_phi_80_96 variable.
summary(survey$curr_phi_80_96)

# What is the average age of survey respondents? What is the median age? 
summary(survey$age)

#(no code required) Why is there a difference between the two?

# How many people voted in a local election? Use the table function.
table(survey$vote_local, exclude = NULL)

# You can also do the same thing using the count function, like this:
survey %>% 
  count(vote_local)

# Did most people say they voted out of a sense of civic duty or because it's a choice? Use the why_vote variable, with either the table or count functions (just like above).

# Create a two-way table that shows whether people voted in a local election, broken down by how they responded to the why_vote question. Use the table function. 
table(survey$vote_local, survey$why_vote)

# This will give you the same thing, but it will look a little different.
survey %>% 
  count(vote_local, why_vote)

# What is the average age of people who voted in a local election? Use group_by, then summarize. 
survey %>% 
  group_by(vote_local) %>% 
  summarize(total = n(),
            avg_age = mean(age, na.rm = T))

# What is the average age of people who protested? Use group_by, then summarize. 
survey %>% 
  group_by(protest) %>% 
  summarize(total = n(),
            avg_age = mean(age, na.rm = T))

# Is there a difference in the average political heterogeneity index (use curr_phi_00_16) of those who voted in a local election vs. those who didn't? Use group_by, then summarize. 

survey %>% 
  group_by(vote_local) %>% 
  summarize(total = n(),
            phi = mean(curr_phi_00_16, na.rm = T))

# Add a variable to your dataset that is the proportion of someone's closest contacts (num_contacts) that they talk politics with (talk_pol). Use the mutate function, and remember to overwrite your original dataset.
survey <- survey %>% 
  mutate(pct_talk_pol = talk_pol / num_contacts)

# Add another variable to your dataset, this time the proportion of people someone talks politics with (talk_pol) that have the same partisan affiliation (talk_pol_sim). Use the mutate function, and remember to overwrite your original dataset.
survey <- survey %>% 
  mutate(pct_talk_pol_sim = talk_pol_sim / talk_pol)

# Get summary statistics for the last variable you just created. Look at the numbers. Notice something that's not quite right???

# Create a NEW dataframe (with a different name) that is just of people who are older than 21.

# Part II

# Filter based on multiple conditions
# Create table of multiple stats

survey %>% 
  filter(pct_talk_pol_sim <= 1) %>% 
  group_by(vote_local) %>% 
  summarize(total = n(),
            phi = mean(curr_phi_00_16, na.rm = T),
            pct_sim = mean(pct_talk_pol_sim, na.rm = T),
            why_vote = mean(why_vote == 'Mainly a duty'),
            school = mean(school_political == 'Not at all important' | school_political == 'Not too important', na.rm = T))

# Plot a bar graph of numbers of people who voted in local elections
ggplot(survey) +
  geom_bar(aes(vote_local)) +
  labs(
    title = "Local Voting",
    x = "Did You Vote in a Local Election?"
  )

# Plot the same thing, based on another variable
ggplot(data = survey) + 
  geom_bar(aes(x = why_vote, fill = vote_local)) +
  facet_wrap(~ age_cats)

# Plot a boxplot

survey %>%
  filter(vote_local == 'Yes' | vote_local == 'No') %>% 
  ggplot() +
  geom_boxplot(aes(x = vote_local, y = age))

# Part III (questions for your paper)

# What is the main independent variable (explanatory factor) and what is the main dependent variable (outcome of interest)? You can have more than one independent variable, if you'd like. 

# How did we measure these in our survey? In other words, are these variables categorical or continuous?

# Run some analysis.

# a. First, show one-variable distributions.
# b. Then, show relationships between two variables. Run group_by and summarize to get tables. Run ggplot to get plots. 
# c. What does your evidence show?

# What are variations of the main question that you may want to explore? Try the following:
  
# a. How do TWO different IVs affect your DV differently?
# b. How does your IV affect TWO different DVs differently?
# c. How do two IVs TOGETHER affect your DV; how would you show this three variable relationship?

# Extra stuff
survey %>% 
  filter(employ != 'Student') %>% 
  group_by(protest) %>% 
  summarize(total = n(),
            tenure = mean(work_hrs, na.rm = T))

hist(survey$age)

table(survey$vote_local, survey$parents_discussion)

survey %>% 
  group_by(contact_congress) %>% 
  summarize(total = n(),
            discuss = mean(age_discussion, na.rm = T))