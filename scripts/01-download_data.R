#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto.
# Author: Haoan Wang
# Date: September 24 2024
# Contact: haoanmartin.wang@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
# install.packages('opendatatoronto')  
# install.packages('tidyverse')
# install.packages('dplyr')  
library(opendatatoronto)
library(tidyverse)
library(dplyr)

#### Download data ####
# 1.Download Park Washroom Facilities Open Data from https://open.toronto.ca/

# 2.Get the package
package <- show_package("Washroom-Facilities-4321")

# 3.Get resources for this package
resources <- list_package_resources("Washroom-Facilities-4321")

# 4.Identify datastore resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# 5.Download the first dataset resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()

#### Save data ####
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(analysis_data, "data/raw_data/analysis_data.csv") 

         
