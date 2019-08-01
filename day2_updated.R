# if you haven't installed this yet, uncomment line #2 and run
# install.packages("tidyverse")

# calculate 
3+5

# a package that is a set of really useful packages for data cleaning and visualization
library(tidyverse) # run just this line (ctrl-Enter)

# if you need help, type a ? then the name of the package or command
# ?tidyverse

# assignment: assign some variable or object (or dataframe) to something on the right hand side. Use "<-"

x <- 5

x

# create a list and assign it to a variable
y <- c(89, 89, 90, 95, 56) # The c function "combines" numbers or other elements.

# run basic stats on your list
mean(y)
table(y)
summary(y)

hist(y)

# import the data file and assign it to an object called anes. Use the read_csv function.

# import dataset
durham <- read_csv('durham.csv')

ow <- durham %>% 
  filter(hood_name == 'Old West Durham') %>% 
  filter(LANDUSE_DE == 'RES/ 2-FAMILY' | LANDUSE_DE == 'RES/ 1-FAMILY') %>% 
  filter(sqft > 0) %>% 
  filter(year_built > 0)

new <- durham %>% 
  filter(LANDUSE_DE == 'RES/ 2-FAMILY' | LANDUSE_DE == 'RES/ 1-FAMILY') %>% 
  filter(sqft > 0) %>% 
  filter(year_built > 2009)

new <- du %>% 
  filter(`DESC LAND USE` == 'RES/ 2-FAMILY' | `DESC LAND USE` == 'RES/ 1-FAMILY') %>% 
  filter(`HEATED SQFT` > 0) %>% 
  filter(`ACTUAL YEAR BUILT` > 2009)

summary(new$`HEATED SQFT`)

7500*.325

ow <- ow %>% 
  mutate(far = sqft / land_sqft)

summary(ow$land_sqft)
summary(ow$sqft)
summary(ow$far)

quantile(ow$far, c(.7, .8, .9, .95)) 

428*.06

(32.5-18)/18

7500*.08

1450/7500

9000*.1

12*365

length(ow$far[ow$year_built > 2009])

# 13 built since 2010; 7 houses wouldn't have been able to be built.

View(durham)

# Print the variable names
names(durham)

# How many observations and variables are in the dataset? 

View(durham)
str(durham)

# get the dimensions (# rows, # columns) of the dataframe
dim(durham)

# get column names of dataframe
names(durham)

# Print table of one variable
table(survey$owner_occ)

# Print table of two variables
table(durham$owner_occ, durham$single_fam)

# mutate
durham <- durham %>%
  mutate(sqft_value = value / sqft)

survey %>% 
  group_by(city_income) %>% 
  summarize(mean_age = mean(age))

summary(durham$sqft_value)

summary(durham$year_built)

# hist(durham$sqft_value, breaks = 10)

# filter - filters out rows based on some condition you give it

# create new dataset with just single family houses
sing_fam <- durham %>%
  filter(single_fam == 1)

new_homes <- durham %>% 
  filter(year_built > 1955)

View(sing_fam)

# filter, then count
# count the number of parcels with assessed values higher than $200,000
durham %>%
  filter(value > 200000) %>%
  count()

# group_by and summarize

# use group_by with the name of the variable you're interested in grouping by
# inside summarize, create variables which are some statistic grouped by hood_name

durham %>%
  group_by(hood_name) %>% 
  summarize(num_parcels = n(),
            median_year_built = median(year_built),
            median_value = median(sqft_value, na.rm = TRUE),
            own_occ_rate = mean(owner_occ)) %>% 
  arrange(desc(own_occ_rate))
