# Stefan Cutovic
# Assignment 4: Incarceration
# 5/26/24

options(repos = c(CRAN = "https://cran.rstudio.com/"))
options(warn=-1)

suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(ggplot2))

library(dplyr)
library(ggplot2)

incarceration_dataset <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")

# Filters dataset for specific counties or racial groups for visualization
trends_data <- incarceration_dataset %>%
  filter((county_name == "Los Angeles County" & state == "CA") |
           (county_name == "Fulton County" & state == "GA") |
           (county_name == "New York County" & state == "NY") |
           (county_name == "Harris County" & state == "TX"))

# Plots prison population of specific counties over time
trends_plot <- ggplot(data = trends_data, aes(x = year, y = total_prison_pop, 
                                              color = paste(county_name, state, sep = ", "))) +
  geom_line(lineWidth = 1) +  
  labs(title = "Prison Population Over Time",
       x = "Year",
       y = "Total Prison Population",
       color = "County, State") +
  theme_minimal() +  
  theme(legend.position = "right",
        plot.title = element_text(hjust = 0.5, face = "bold"))

print(trends_plot)