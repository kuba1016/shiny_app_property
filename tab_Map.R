tab_map <- function() {
  tabPanel(
    h5("Map"),
    fluidRow(
      column(10, plotOutput("maps")),
      column(
        2,
        selectInput("market_map", h6("Market"), choices = c("All", "New build", "Open market"), selected = "All"),
        selectInput("metric", h6("Metric"), choices = c("number_offers", "median_price", "median_m2", "median_plot_m2"), selected = "number_offers")
      )
    )
  )
}
