library(shiny)
library(shinydashboard)
library(vroom)
library(tidyverse)
library(bslib)
source("tabTable.R")
source("tabMain.R")
source("tab_Map.R")

# loding data.
new_homes <- vroom("data/new_homes.csv") %>%
  select(-url) %>%
  filter(m2 > 20)
old_homes <- vroom("data/old_homes.csv") %>%
  select(-url) %>%
  filter(m2 > 20)
