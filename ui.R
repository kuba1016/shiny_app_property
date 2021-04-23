
ui <- navbarPage(h4("Polish Property App"),
  theme = bs_theme(bootswatch = "flatly"),
  tab_main(),
  tab_map(),
  tab_table(),
  br(),
  hr()
  
)
