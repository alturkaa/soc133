### Group questions (10/17/17)

library(tidyverse)

survey <- read_csv("final_survey.csv")

# Turn in only one .R file per group (add it to one of your Drop Boxes in Sakai)

# Each group focuses on ONE section. You can work on other sections for practice for your blog posts.

# Write names of group members in a comment below
# names here

### For each relationship (between two or three variables), answer 3 questions: 

# 1) what is the expectation based on our readings? 

# 2) what is the R code you'd run to assess this?

# 3) does the output (table or plot) confirm or disconfirm the expectation from question #1 (or is the evidence not clear)?

### Example

# Relationship between age and voting. Most research suggests that age and voting are positively associated with each other (the older you are, the more likely you are to vote)

# grouping by age categories and then getting the percent of those categories who voted in a primary

survey %>%
  group_by(age_cats) %>%
  summarize(total = n(),
            vote = mean(vote_primary == "Yes", na.rm=TRUE)) %>%
  arrange(desc(vote))
  
# The evidence suggests that the older people are, the more likely they are to vote. This confirms the hypothesis. 

### Section 1: individual-level explanations for why people vote

# focus on voting in a primary

# a. education

# b. marital status

# c. interest in politics

# d. discussion of politics

# e. political efficacy

# f. whether you think voting is a duty or a choice

# g. pick another individual-level factor

# h. test some of these factors on something aside from voting

### Section 2: networks and context effect on why people vote

# focus on voting in a primary

# a. political heterogeneity of county

# b. heterogeneity of your social network

# c. how do a. and b. relate?

# d. sleeper effect of school's civic climate -- how would you test this with our survey?

# e. voice in high school and political heterogeneity of high school county

# f. voice in high school and voting

# g. engagement of parents

# h. test some of these factors on something aside from voting

### Section 3: other relationships

# a. religion's effects on volunteering

# b. religion's effects on charitable giving

# c. work hours and civic engagement

# d. employment and civic engagement

# e. commute time and civic engagement

# f. TV watching and civic engagement

# g. Social media and civic engagement (pick 1 or 2 things about social media usage from our survey)

# h. Social trust and (pick something)
