###########################################################################
# Animated CO2 Emissions Over Time
# Created: 14/08/2024
# https://github.com/ariyoamy/animated_co2_emissions

###########################################################################

setwd("~/Documents/github_repos/animated_co2_emissions")


# Install these packages if you haven't already
install.packages("ggplot2")     
install.packages("gganimate")   
install.packages("wbstats")     
install.packages("dplyr")    
install.packages("gifski")
install.packages("tidyverse")

# Load the libraries
library(ggplot2)
library(gganimate)
library(wbstats)
library(dplyr)
library(gifski)
library(tidyverse)

# Get CO2 emissions data from World Bank (you can do this manually as well)
# You can change the 'indicator' to any other relevant World Bank indicator code to get different data.
data <- wb_data(indicator = "EN.ATM.CO2E.PC", 
                start_date = 1990, 
                end_date = 2020)

# Check the structure of the data to understand the column names
str(data)

# Filter to a manageable number of countries and tidy the data
# 'countries' holds the ISO3 country codes. Change this to include/exclude countries as needed.
countries <- c("USA", "CHN", "DEU", "JPN", "IND", "GBR", "FRA", "BRA", "ITA", "CAN")

# Filter the data for selected countries and rename columns
data_filtered <- data %>%
  filter(iso3c %in% countries) %>%
  select(date, country, iso3c, EN.ATM.CO2E.PC) %>%
  rename(Year = date, CO2_Emissions = EN.ATM.CO2E.PC)

# Preview data to make sure everything looks okay
view(data_filtered)

# Create the static line plot
p <- ggplot(data_filtered, aes(x = Year, 
                               y = CO2_Emissions, 
                               color = country, 
                               group = country)) +
  geom_line() +
  geom_point(size = 2) +
  labs(title = 'CO2 Emissions Over Time',
       subtitle = 'Metric tons per capita (1990-2020)',
       y = 'CO2 Emissions (metric tons per capita)',
       x = 'Year',
       color = 'Country') +
  theme_minimal()

# Add the animation with gganimate
animated_plot <- p + 
  transition_reveal(Year) +
  ease_aes('linear') +
  theme(legend.position = "right") +
  labs(caption = "Data Source: World Bank via wbstats")

# Save the animation
animate(animated_plot, 
        nframes = 200, 
        fps = 10, 
        width = 800, 
        height = 600, 
        renderer = gifski_renderer("animated_co2_emissions.gif"))

# You can also save it as a video (uncomment lines below)
# Use 'av_renderer()' for saving as a video. 
# animate(animated_plot, nframes = 200, fps = 10, width = 800, height = 600, renderer = av_renderer("co2_emissions.mp4"))
