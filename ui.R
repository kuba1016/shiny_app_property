
ui <- navbarPage(h4("Polish Property App."),
  theme = bs_theme(bootswatch = "minty"),
  tabPanel(
    h5("Main"),
    fluidRow(
      column(12, plotOutput("m2_plot"))
    ),
    fluidRow(
      column(3, selectInput("market", h6("Market"), choices = c("New build", "Open market"), selected = "New build")),
      column(3, selectInput("voiv", h6("Voivodeship"), choices = c("All", unique(new_homes$voivodeship)), selected = "All"))
    ),
    fluidRow(
      column(3, valueBoxOutput("no_obs")),
      column(3, valueBoxOutput("median_m2")),
      column(3, valueBoxOutput("max_m2")),
      column(3, valueBoxOutput("min_m2"))
    ),
    fluidRow(column(12, dataTableOutput("homes")))
  ),
  tabPanel(
    h5("Map"),
    sliderInput("obs", "Number of observations:", min = 10, max = 500, value = 100)
  ),
  tabPanel(
    h5("About"),
    sliderInput("obs", "Number of observations:", min = 10, max = 500, value = 100)
  )
)
