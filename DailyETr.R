# Calculate daily ETr from the output file given by Ref-ET

# Packages ####
library(readxl)
library(dplyr)
library(tidyverse)

# Data from excel
data=read.csv("Ref-ET_out.csv") 

# Calculate the daily ETr average (mm/h)
ETr=data %>%
  group_by(DoY) %>%
  summarise(ETr_hly=mean(ETr)) 

# Calculate daily ETr (mm/day)
ETr$ETr_dly=ETr$ETr_hly*24

# recreate the dates column
ETr$Date=seq(as.Date("2019-06-01"), as.Date("2019-09-30"), by="days")

# Save the results
write.csv(ETr, 'ETr.csv')

