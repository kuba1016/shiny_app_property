
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
  
  output$no_obs <- renderValueBox(
    valueBox(data() %>% n_distinct(),subtitle = "no.observations")
    
  )
  
  output$median_m2 <- renderValueBox(
    valueBox(data() %>% median(m2,na.rm = T),subtitle = "Mean")
    
  )
}
