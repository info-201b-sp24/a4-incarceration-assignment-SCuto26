# Stefan Cutovic
# Assignment 4: Incarceration
# 5/26/24

options(repos = c(CRAN = "https://cran.rstudio.com/"))
options(warn=-1)

suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(maps))

library(dplyr)
library(ggplot2)

# Deemed most suitable for geospatial visualization
library(maps)

# Filters dataset for the year 2016
incarceration_2016 <- incarceration_dataset %>%
  filter(year == 2016)

# Summarizes total prison population by state in 2016
state_prison_pop <- incarceration_2016 %>%
  group_by(state) %>%
  summarize(total_prison_pop = sum(total_prison_pop, na.rm = TRUE))

# Acquires state map data from 'maps' package
states_map <- map_data("state")

# 'maps' package takes in full state names, not abbreviations like in dataset
# region names within package are only accepted when lowercase
state_prison_pop$region <- tolower(state.name[match(state_prison_pop$state, state.abb)])

# Creates choropleth map
prison_map <- ggplot(state_prison_pop, aes(map_id = region)) +
  geom_map(aes(fill = total_prison_pop), map = states_map, color = "white") +
  expand_limits(x = states_map$long, y = states_map$lat) +
  scale_fill_gradient(low = "lightblue", high = "darkblue", na.value = "gray", 
                          labels = scales::comma) +
  labs(title = "Total Prison Population by State in 2016",
       fill = "Prison Population") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    legend.position = "right"
  )

print(prison_map)