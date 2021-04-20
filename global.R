library(shiny)
library(shinydashboard)
library(vroom)
library(tidyverse)
library(bslib)

new_homes <- vroom("data/new_homes.csv") %>% 
  select(-url)