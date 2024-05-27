# Load necessary packages
library(ggplot2)

install.packages("dplyr")
library(dplyr)

incarceration_dataset <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")

# Filter the dataset for specific counties or racial groups
trends_data <- incarceration_dataset %>%
  filter(county_name %in% c("Los Angeles County", "Fulton County")) %>%
  # You can also filter by racial groups using similar logic
  
  # Plotting Trends Over Time
  trends_plot <- ggplot(data = trends_data, aes(x = year)) +
  geom_line(aes(y = total_prison_pop, color = county_name), size = 1) +  # Adjust 'y' and 'color' aesthetics based on your selected variables
  labs(title = "Trends in Prison Population Over Time",
       x = "Year",
       y = "Total Prison Population",
       color = "County") +  # Customize axis and legend labels
  theme_minimal() +  # Adjust plot theme as desired
  theme(legend.position = "bottom")  # Adjust legend position as desired

# Display the plot
print(trends_plot)