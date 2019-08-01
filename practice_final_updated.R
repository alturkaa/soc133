library(tidyverse)

counties <- read_csv("full_data.csv")

dim(counties)

cond <- counties %>% 
  select(year, State, County, median_income, share_ed)

cond <- cond %>% 
  group_by(County) %>% 
  mutate(inc_lag = lag(median_income),
         ed_lag = lag(share_ed),
         inc_change = median_income - inc_lag,
         ed_change = share_ed - ed_lag)

cond <- cond %>%
  mutate(region = ifelse(State == 'AL' | State == 'MS', 'ds'))

# look at the data
View(counties)

# check how many counties are in the dataset by year
table(counties$party)

# 1. Count number of NC counties, 2. Count most dense counties, 3. Create new dataframe, 4. Relationship between density and party 

mean(counties$density)

dense_counties_nc <- counties %>% 
  filter(density >= 500 & State == 'NC')

counties %>% 
  group_by(year) %>% 
  count(density >= 500)

counties %>% 
  group_by(year, party) %>% 
  summarize(total = n(),
            dense = mean(density >= 500, na.rm = T))

### create new variables
### need to create variables that give you percentages rather than raw numbers

# gop percent

counties <- counties %>%
  mutate(gop_pct = R / votes_total)

counties <- counties %>%
  mutate(dem_pct = D / votes_total)

mean()

counties %>% 
  group_by(year) %>% 
  summarize(dem_avg = mean(dem_pct))
  
  count(gop_pct >= .6 | dem_pct >= .6)

counties %>% 
  select(R, D, votes_total)

counties <- counties %>% 
  mutate(manuf_share = manufacturing / pop_16_over)


nc <- counties %>% 
  filter(State == 'NC')


# dem percent

# voter turnout (use 18 and above population as denominator)

# difference between GOP percent and Dem percent (can you get the absolute value? [Google it!])

# share of Hispanics (use full population in denominator)

# share of non-Hispanic whites

# employment figures??? (use population above 16 as denominator)

# education level (use population above 25 as denominator)

### create tables with group_by and summarize

# What's the average share of Hispanics (by county) over the years? 

# Has the share of whites with less than a HS degree gone down over the years? Show in a table.

counties <- counties %>% 
  mutate(less_HS_whites = white_less_HS / white_25_over)

counties %>% 
  group_by(year) %>% 
  summarize(less_hs = mean(less_HS_whites))

### plot different relationships between variables

# plot relationship between pop density and party

counties %>% 
  filter(year == 1992 | year == 2016) %>% 
  ggplot(aes(x = median_income, y = dem_pct)) +
    geom_point() +
    geom_smooth() +
    facet_wrap(~ year)

summary(lm(share_creative ~ median_income + share_same_house, data = counties))

nc %>% 
  filter(year == 1992 | year == 2016) %>% 
  ggplot(aes(x = , y = )) +
  # geom_point() +
  geom_smooth() +
  facet_wrap(~ year)

  

# plot relationship between party and the following (share of whites, share of foreign-born, education, share of old people)