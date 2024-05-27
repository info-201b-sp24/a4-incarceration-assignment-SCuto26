# Stefan Cutovic
# Assignment 4: Incarceration
# 5/26/24

options(repos = c(CRAN = "https://cran.rstudio.com/"))
options(warn=-1)

suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(ggplot2))

library(dplyr)
library(ggplot2)

# Filters dataset for Los Angeles County
la_county_data <- incarceration_dataset %>%
  filter(county_name == "Los Angeles County" & state == "CA")

# Plots LA County's black prison pop to total pop over time
scatter_plot <- ggplot(la_county_data, aes(x = total_prison_pop, y = black_prison_pop)) +
  geom_point() +
  geom_smooth(formula = y ~ x, method = "lm", se = FALSE, color = "blue") +  # Add a linear trend line
  labs(title = "Los Angeles County: Black Prison Population to Total Population Over Time",
       x = "Total Prison Population",
       y = "Black Prison Population") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),  # Center and bold the title
  )

print(scatter_plot)