


tab_table <- function() {
  tabPanel(
    h5("About"),
    fluidRow(column(12, dataTableOutput("homes")))
  )
}
