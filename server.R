
server <- function(input, output) {
  # reactivity for the all boxes and plot. 
  data <- reactive(if ("All" %in% input$voiv) {
    new_homes
  } else {
    new_homes %>% filter(voivodeship == input$voiv)
  })
  
  # rendering dataTable.
  output$homes <- renderDataTable(data(), options = list(pageLength = 5))
  # rendering histogram 
  output$m2_plot <- renderPlot(
    ggplot(data(), aes(m2)) +
      geom_histogram(color = "white", fill = "#78C2AD") +
      geom_vline(aes(xintercept = mean(data()$m2, na.rm = T))) +
      theme_minimal(),
    res = 96
  )
# value boxes : min, max, median, number of observations. 
  output$no_obs <- renderValueBox(
    valueBox(data() %>% n_distinct(), subtitle = "no.observations")
  )

  output$median_m2 <- renderValueBox(
    valueBox(median(data()$m2, na.rm = TRUE), subtitle = "Median (m2)",width = 3)
  )
  output$max_m2 <- renderValueBox(
    valueBox(max(data()$m2, na.rm = TRUE), subtitle = "Max (m2)")
  )
  output$min_m2 <- renderValueBox(
    valueBox(min(data()$m2, na.rm = TRUE), subtitle = "Max (m2)")
  )
}
