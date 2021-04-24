


tab_table <- function() {
  tabPanel(
    h5("Data"),
    fluidRow(
      column(12, tags$div(
        class = "header", checked = NA,
        h3("About project."),
        br(),
        tags$p("Small shiny app presenting the statae of the polish housing market in 2020. Data used in the project was web scraped from otodom.pl. Otodom.pl is a agregator of property adverts mostly from Poland. Its not the only player on the market but  collected sample size is big enough to give user overall picture of the housing market in Poland."),
        div(
          h6("Author: Jakub Kozanowski"),
          p(strong("kuba1016@gmail.com"))
        ),
        div(
          a(href = "https://github.com/kuba1016/shiny_app_property", "GitHub repository - Click here! !")
        ),
        br(),
        h4("Data used:"),
        hr()
      )),
      fluidRow(column(12, dataTableOutput("homes")))
    )
  )
}
