
server <- function(input, output) {
  data <- reactive(if ("All" %in% input$voiv) {
    new_homes 
  } else {
    new_homes %>% filter(voivodeship == input$voiv)
  })

  output$homes <- renderDataTable(data(), options = list(pageLength = 10))
  output$m2_plot <- renderPlot(
    ggplot(data(),aes(m2))+
      geom_histogram(color = "white")+
      theme_minimal()
  )
}
