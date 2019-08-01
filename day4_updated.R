# use tidyverse library
library(tidyverse)

# import Excel sheet of full survey responses
survey <- read_csv('full_survey.csv')

anna <- survey %>%
  group_by(volunteer_times) %>%
  summarize(total = n(),
            vol_import = mean(citizen_volunteer == 'A great deal', na.rm
                              = T))

my_graph2 <- survey %>%
  group_by(volunteer_times) %>%
  summarize(total = n(),
            par_vol = mean(par_volunteer == 'Every week' | par_volunteer == 'Almost every week', na.rm = T))

survey$citizen_voting <- factor(survey$citizen_voting, c("A great deal", "A moderate amount", "A little", "None at all"))

survey$citizen_voting <- factor(survey$citizen_voting, levels = x$name[order(x$val)])
x$name  # notice the changed order of factor levels

table(survey$par_volunteer)

# get observations (number of people) and variables in dataset
dim(survey)

# to see whether survey is representative of U.S. population, get distribution of a few demographic (and partisanship) variables that you can compare to easily available national data
table(survey$race)
table(survey$age_cats)
table(survey$educ)
summary(survey$age)

### Option 1 (one IV and one DV)

# get distribution of dependent variable
table(survey$partisan_3pt)

table(survey$gender)

table(survey$citizen_voting)

table(survey$gender, survey$why_vote)

# visualize it
opt1_plt1 <- ggplot(survey) +
  geom_bar(aes(x = partisan_3pt, y = ..prop.., group=1)) +
  labs(title = 'Partisanship',
       x = 'Partisan Identification',
       y = 'Proportion of Total') +
  theme_bw()

# save it, as either .jpg or .png file
ggsave('partisan_bar.jpg', opt1_plt1)

# get distribution of independent variable
table(survey$govt_services)

# visualize it
ggplot(survey) +
  geom_bar(aes(x = govt_services)) +
  coord_flip()

# if your variable is continuous, use geom_histogram or geom_density instead of geom_bar
ggplot(survey) +
  geom_histogram(aes(x = age))

# two-way table
table(survey$partisan_3pt, survey$govt_services)

# first way to do a group_by table
opt1_tbl1 <- survey %>% 
  group_by(gender) %>% 
  summarize(total = n(),
            duty_yes = mean(why_vote == 'Mainly a duty', na.rm = TRUE))

brett <- survey %>% 
  group_by(citizen_voting) %>% 
  summarize(total = n(),
            protest_yes = mean(protest == 'Yes', na.rm = T),
            vote_yes = mean(vote_pres == 'Yes', na.rm = T)) %>% 
  arrange(desc(protest_yes))

table(survey$volunteer_org)

survey$soci

# write table to .txt file that you can then paste into Word. For other tables, make sure to edit opt1_tbl1 and the file name
write.table(opt1_tbl1, file='tbl1.txt', quote = F, row.names = F, sep = ',')

# second way to do a group_by table
opt1_tbl2 <- survey %>% 
  group_by(govt_services) %>% 
  summarize(total = n(),
            prop_conservatives = mean(partisan_3pt == 'Conservative', na.rm = T)) %>% 
  arrange(desc(prop_conservatives))

# Visualize the tables you just created

ggplot() +
  dfkljsd;klf +
  labs

ggplot(opt1_tbl1) +
  geom_bar(aes(x = partisan_3pt, y = more_services), stat = 'identity') +
  labs(title = 'Proportion of Partisans Who Think Government Should Provide More Services',
       x = 'Self-Identified Partisanship',
       y = 'Proportion Wanting More Government Services') + 
  theme_classic()

# Visualize it differently. A little harder to intepret, but more comprehensive.
# use position = 'fill' or position = 'dodge' to get different looks
ggplot(survey) +
  geom_bar(aes(x = citizen_voting, fill = protest), position = 'dodge')

### Option 2 (multiple IVs and one DV [building on option 1])

opt2_tbl1 <- survey %>% 
  group_by(partisan_3pt) %>% 
  summarize(total = n(),
            more_services = mean(govt_services == 'Govt should provide more services' | govt_services == 'Govt should provide many more services', na.rm = T),
            soc_trust = mean(social_trust == 'Always' | social_trust == 'Most of the time', na.rm = T)) %>% 
  arrange(desc(soc_trust))

# figure of social trust
ggplot(opt2_tbl1) +
  geom_bar(aes(x=partisan_3pt, y=soc_trust), stat = 'identity')

# figure of more services
ggplot(opt1_tbl1) +
  geom_bar(aes(x=partisan_3pt, y=more_services), stat = 'identity')

# Visualize it differently. A little harder to intepret, but more comprehensive.
# use position = 'fill' or position = 'dodge' to get different looks
ggplot(survey) +
  geom_bar(aes(x = social_trust, fill = partisan_3pt), position = 'dodge') + 
  coord_flip()

### Option 3 (one IV and multiple DVs [building on option 1])

# Is there a correlation between believing strongly in freedom of speech and views on gov't services?  
opt3_tbl1 <- survey %>% 
  group_by(disruption) %>% 
  summarize(total = n(),
            more_services = mean(govt_services == 'Govt should provide more services' | govt_services == 'Govt should provide many more services', na.rm = T)) %>% 
  arrange(desc(more_services))

# Visualize table you just created
ggplot(opt3_tbl1) +
  geom_bar(aes(x=disruption, y=more_services), stat = 'identity')

# ordered graph of one just created
ggplot(opt3_tbl1) +
  geom_bar(aes(x=reorder(disruption, more_services), y=more_services), stat = 'identity')

# Visualize all answers. More comprehensive.
ggplot(survey) +
  geom_bar(aes(x = disruption, fill = govt_services), position = 'dodge') + 
  coord_flip()

### Option 4 (relationship between IV and DV, conditional on another variable)

opt4_tbl1 <- survey %>% 
  group_by(partisan_3pt) %>% 
  summarize(total = n(),
            ok_disruption = mean(disruption == 'Strongly agree' | disruption == 'Agree', na.rm = T)) %>% 
  arrange(desc(ok_disruption))

# Add your third variable to the parentheses after group_by
survey %>% 
  group_by(partisan_3pt, protest) %>% 
  summarize(total = n(),
            ok_disruption = mean(disruption == 'Strongly agree' | disruption == 'Agree', na.rm = T)) %>% 
  arrange(desc(ok_disruption))

# Visualize the effect of the third variable by adding facet_wrap() to this code
ggplot(survey) +
  geom_bar(aes(x = vote_local, fill = city_income), position = 'dodge') + 
  coord_flip() +
  facet_wrap(~ educ)

# adding facet_wrap() to this code
ggplot(survey) +
  geom_boxplot(aes(x = why_vote, y = curr_phi_00_16)) + 
  facet_wrap(~ partisan_3pt)

# Putting it all together, using filters and ggplot all in one piece of code. 

survey %>% 
  filter(protest == 'Yes' | protest == 'No') %>% 
  filter(partisan_3pt == 'Liberal' | partisan_3pt == 'Conservative') %>% 
  ggplot() +
  geom_bar(aes(x = partisan_3pt, fill = disruption), position = 'dodge') + 
  coord_flip() +
  facet_wrap(~ protest) +
  labs(title = 'Figure 2. Such and such',
       y = 'Protest or Not',
       x = 'Partisanship')

# if you're interested in the relationship between a categorical and continuous variable, use geom_boxplot rather than geom_bar
# black line in middle of boxplot is the median
ggplot(survey) +
  geom_boxplot(aes(x = partisan_3pt, y = age))
