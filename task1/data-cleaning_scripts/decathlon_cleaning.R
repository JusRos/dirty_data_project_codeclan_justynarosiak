
#load libraries
library(tidyverse)
library(janitor)
library(here)

# read in data
here::here()

decathlon <- readRDS(here(here("raw_data/decathlon.rds")))


# explore data
view(decathlon)
head(decathlon)
tail(decathlon)
names(decathlon)
glimpse(decathlon)
