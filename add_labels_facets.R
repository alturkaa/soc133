library(tidyverse)

survey <- read_csv("final_survey.csv")

# options to wrap text
# adding na.rm to group_by and summarize
# using arrange with group_by
# more plotting 
# adding labels
# facets
# saving plots

survey %>%
  group_by(age_cats) %>%
  summarize(total = n(),
            disruption = mean(disruption == 'Strongly disagree' | disruption == 'Disagree', na.rm=TRUE)) %>%
  arrange(desc(disruption))

ggplot(survey) +
  geom_count(aes(age_cats, disruption), na.rm=TRUE) 
# facet_wrap(~ partisan_3pt, nrow = 2) +
# labs(title = "Free Speech By Age and Political Party", x = "Age", y = "OK With Disruption of Speech?")

# ggsave('partisan_disruption_age.png')