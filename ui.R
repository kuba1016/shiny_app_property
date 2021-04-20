
ui <- fluidPage(
  tabsetPanel(
    tabPanel(
      "Main",
      fluidRow(
        column(3, selectInput("voiv", "Voivodeship", choices = c("All", unique(new_homes$voivodeship)))),
        column(6, plotOutput("m2_plot")),
        column(3, valueBoxOutput("no_obs"))
      ),
      fluidRow(column(3, sliderInput("rooms", "Number of rooms:", min = 0, max = max(new_homes$rooms, na.rm = T), value = 4))),
      fluidRow(column(12, dataTableOutput("homes")))
    ),
    tabPanel(
      "Map",
      sliderInput("obs", "Number of observations:", min = 10, max = 500, value = 100)
    ),
    tabPanel(
      "About",
      sliderInput("obs", "Number of observations:", min = 10, max = 500, value = 100)
    )
  )
)
