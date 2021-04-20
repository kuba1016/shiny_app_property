library(shiny)
library(shinydashboard)
library(vroom)
library(tidyverse)

new_homes <- vroom("data/new_homes.csv") %>% 
  select(-url)