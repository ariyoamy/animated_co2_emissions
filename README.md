# Animated CO2 Emissions Over Time

## Description
This project visualises CO2 emissions per capita across multiple countries from 1990 to 2020 using R. The animation helps to track and compare how different countries have contributed to global CO2 emissions over time. The project uses data from the World Bank, and it aims to give insights into environmental changes.

## Programs and Libraries Used
- **R (with RStudio)**
- **R Libraries:**
  - `ggplot2` For creating the base line plots.
  - `gganimate` For animating the plots to show changes over time.
  - `wbstats` For retrieving CO2 emissions data directly from the World Bank.
  - `dplyr` For data manipulation and wrangling.
  - `gifski` For rendering the animation as a GIF.
  - `tidyverse` A suite of R packages that includes `dplyr` and others for data science.

## Installation
1. **Install R:** Make sure you have R installed. You can download it from [CRAN](https://cran.r-project.org/).
2. **Install RStudio:** (Optional but recommended) Download [RStudio](https://rstudio.com/products/rstudio/download/) 
3. **Install the required R packages:**
   ```
   install.packages(c("ggplot2", "gganimate", "wbstats", "dplyr", "gifski", "tidyverse"))
   ```
