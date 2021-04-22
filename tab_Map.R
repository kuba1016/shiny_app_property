tab_map <- function() {
  tabPanel(
    h5("Map"),
    fluidRow(
      column(10, plotOutput("map")),
      column(
        2,
        selectInput("market", h6("Market"), choices = c("All", "New build", "Open market"), selected = "All"),
        selectInput("metric", h6("Metric"), choices = c("number_offers", "median_price"), selected = "All")
      )
    )
  )
}
