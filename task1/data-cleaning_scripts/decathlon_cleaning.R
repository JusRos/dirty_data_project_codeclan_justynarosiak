
#load libraries
library(tidyverse)
library(janitor)
library(here)

# read in data


decathlon <- readRDS(here("raw_data/decathlon.rds"))


# explore data

head(decathlon)

# noticed that there are row names, so converted them into names column 
# and reassigned to decathlon

rownames_to_column(decathlon, var = " ")

has_rownames(decathlon)
decathlon <- rownames_to_column(decathlon, var = "names") %>% as_tibble()

#cleaned names
decathlon <- clean_names(decathlon)

names(decathlon)

#renamed columns

decathlon <- rename(decathlon, "names" = "names", "short_run" = "x100m", "long_jump" = "long_jump", 
"shot_put" ="shot_put", "high_jump" = "high_jump", "long_run" = "x400m",
"hurdle_run" = "x110m_hurdle","dicus" = "discus", "pole_vault" = "pole_vault","javeline" = "javeline", "1500_run" = "x1500m", "rank" = "rank", "points" = "points","competition_name" = "competition")

  

glimpse(decathlon)

# change formatting of 'names' column 
decathlon <- decathlon %>% 
  mutate(names = str_to_title(names))

glimpse(decathlon)

# check for any NAs and how many there are across the entire df
missing_values <- sum(is.na(decathlon))


# write a file as a .csv
 
write_csv(decathlon, file = "clean_data/decathlon_clean.csv")

  