
tab_main <- function() {
  tabPanel(
    h5("Main"),
    fluidRow(
      column(3, box(imageOutput("img", height = 100, width = 100, inline = T))),
      column(3, valueBoxOutput("median_price")),
      column(3, valueBoxOutput("max_price")),
      column(3, valueBoxOutput("min_price"))
    ),
    fluidRow(
      column(6, plotOutput("m2_plot")),
      column(6, plotOutput("price_plot"))
    ),
    fluidRow(
      column(3, valueBoxOutput("no_obs")),
      column(3, valueBoxOutput("median_m2")),
      column(3, valueBoxOutput("max_m2")),
      column(3, valueBoxOutput("min_m2"))
    ),
    fluidRow(
      column(3, selectInput("market", h6("Market"), choices = c("All", "New build", "Open market"), selected = "All")),
      column(3, selectInput("voiv", h6("Voivodeship"), choices = c("All", unique(new_homes$voivodeship)), selected = "All"))
    )
  )
}
