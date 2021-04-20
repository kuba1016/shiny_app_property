
server <- function(input, output) {
  data <- reactive(if ("All" %in% input$voiv) {
    new_homes 
  } else {
    new_homes %>% filter(voivodeship == input$voiv)
  })

  output$homes <- renderDataTable(data(), options = list(pageLength = 10))
}
