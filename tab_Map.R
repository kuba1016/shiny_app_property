tab_map <- function() {
  tabPanel(
    h5("Map"),
    fluidRow(
      column(10, plotOutput("map")),
      column(
        2,
        selectInput("market", h6("Market"), choices = c("All", "New build", "Open market"), selected = "All"),
        selectInput("voiv", h6("Voivodeship"), choices = c("All", unique(new_homes$voivodeship)), selected = "All")
      )
      
    )
  )
}
