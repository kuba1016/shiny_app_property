
ui <- fluidPage(
  tabsetPanel(
    tabPanel(
      "Main",
      fluidRow(
        column(6, sliderInput("obs", "Number of observations:", min = 10, max = 500, value = 100)),
        column(6, selectInput("voiv", "Voivodeship", choices = unique(new_homes$voivodeship))),
        fluidRow(column(12, dataTableOutput("homes")))
      )
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

