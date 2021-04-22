library(shiny)
library(shinydashboard)
library(vroom)
library(tidyverse)
library(bslib)

# loding data.
new_homes <- vroom("data/new_homes.csv") %>%
  select(-url) %>%
  filter(m2 > 20) %>% 
  mutate(voivodeship = str_trim(voivodeship))
old_homes <- vroom("data/old_homes.csv") %>%
  select(-url) %>%
  filter(m2 > 20)
