# Stefan Cutovic
# Assignment 4: Incarceration
# 5/26/24

library(dplyr)

incarceration_dataset <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")

# Acquires column names from dataset
dataset_column_names <- colnames(incarceration_dataset)

# Determines number of rows in dataset
number_of_rows <- nrow(incarceration_dataset)


#####################################################
############### COUNTY-SPECIFIC #####################
#####################################################



# Filters dataset for the year 1970 and finds county w/ highest prison population
county_highest_prison_pop_1970 <- incarceration_dataset %>%
  filter(year == 1970) %>%
  slice(which.max(total_prison_pop)) %>%
  select(county_name) %>%
  pull()


# Filter sdataset for the year 2018 and finds county w/ highest prison population
county_highest_prison_pop_2018 <- incarceration_dataset %>%
  filter(year == 2016) %>%
  slice(which.max(total_prison_pop)) %>%
  pull(county_name)


#####################################################
######### BLACK PRISON POPULATION SPECIFIC ##########
#####################################################


# Filters dataset for the year 2016
incarceration_2016 <- incarceration_dataset %>%
  filter(year == 2016)

# Calculates total prison population for all counties in 2016
total_prison_pop_2016 <- sum(incarceration_2016$total_prison_pop, na.rm = TRUE)

# Calculates total black prison population for all counties in 2016
total_black_prison_pop_2016 <- sum(incarceration_2016$black_prison_pop, 
                                      na.rm = TRUE)

# Calculates proportion of black prison population to total prison population
proportion_black_to_total <- total_black_prison_pop_2016 / total_prison_pop_2016


# Filters dataset for Los Angeles County in the year 2016
la_county_2016 <- incarceration_dataset %>%
  filter(county_name == "Los Angeles County", year == 2016)

# Calculates total prison population and black prison population for 
# Los Angeles County in 2016
total_prison_pop_la_2016 <- sum(la_county_2016$total_prison_pop, na.rm = TRUE)
black_prison_pop_la_2016 <- sum(la_county_2016$black_prison_pop, na.rm = TRUE)

# Calculates proportion of black prison population to total prison population
# in Los Angeles County in 2016
proportion_black_to_total_la_2016 <- black_prison_pop_la_2016 / 
                                                  total_prison_pop_la_2016


# Filters dataset for the years 1970 and 2016
incarceration_1970 <- incarceration_dataset %>%
  filter(year == 1970)
incarceration_2016 <- incarceration_dataset %>%
  filter(year == 2016)

# Calculates total black prison population from 1970 to 2016
total_black_prison_pop_1970 <- sum(incarceration_1970$black_prison_pop, 
                                        na.rm = TRUE)

total_black_prison_pop_2016 <- sum(incarceration_2016$black_prison_pop, 
                                        na.rm = TRUE)

# Calculates difference in total number of black prison population 
# between 1970 and 2016
difference_black_prison_pop <- total_black_prison_pop_2016 - 
                                      total_black_prison_pop_1970


#####################################################
######### WHITE PRISON POPULATION SPECIFIC ##########
#####################################################


# Calculates total prison population for all counties in 2016
total_prison_pop_2016 <- sum(incarceration_2016$total_prison_pop, 
                                na.rm = TRUE)

# Calculates total black prison population for all counties in 2016
total_white_prison_pop_2016 <- sum(incarceration_2016$white_prison_pop, 
                                        na.rm = TRUE)

# Calculates proportion of white prison population to total prison population
proportion_white_to_total <- total_white_prison_pop_2016 / total_prison_pop_2016


# Calculates total prison population and black prison population for 
# Los Angeles County in 2016
total_prison_pop_la_2016 <- sum(la_county_2016$total_prison_pop, na.rm = TRUE)
white_prison_pop_la_2016 <- sum(la_county_2016$white_prison_pop, na.rm = TRUE)

# Calculates proportion of white prison population to total prison population 
# in Los Angeles County in 2016
proportion_white_to_total_la_2016 <- white_prison_pop_la_2016 / 
                                        total_prison_pop_la_2016


# Calculates total white prison population from 1970 to 2016
total_white_prison_pop_1970 <- sum(incarceration_1970$white_prison_pop, 
                                        na.rm = TRUE)

total_white_prison_pop_2016 <- sum(incarceration_2016$white_prison_pop, 
                                        na.rm = TRUE)

# Calculates difference in total number of white prison population from 1970 to 2016
difference_white_prison_pop <- total_white_prison_pop_2016 - 
                                        total_white_prison_pop_1970


