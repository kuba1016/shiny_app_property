library(shiny)
library(shinydashboard)
library(vroom)
library(tidyverse)
library(bslib)
library(sf)
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
# maps
# loading shape file

woj_sp <- read_sf("data/ne_10m_admin_1_states_provinces/")
#shape file manipulation
woj_sf <- woj_sp %>% filter(iso_a2 == "PL") %>% 
  select(name_pl,geometry) %>% 
  mutate(name_pl = str_remove(name_pl,"województwo ")) %>% 
  mutate(name_pl = str_remove(name_pl,"-"))
#map data
map_df <- new_homes %>% 
  group_by(voivodeship) %>% 
  summarise(number_offers=sum(n()),
            mean_price = mean(price,na.rm = T),
            median_price = median(price,na.rm = T),
  ) %>%
  ungroup() %>% 
  left_join(woj_sf,by=c("voivodeship"="name_pl"))