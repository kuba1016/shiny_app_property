
server <- function(input, output) {
  homes_df <- reactive(
    switch(input$market,
      "New build" = new_homes,
      "Open market" = old_homes,
      "All" = rbind(new_homes, old_homes)
    )
  )



  # reactivity for the all boxes and plot.
  data <- reactive(
    if ("All" %in% input$voiv) {
      homes_df()
    } else {
      homes_df() %>% filter(voivodeship == input$voiv)
    }
  )


  # rendering dataTable.
  output$homes <- renderDataTable(data(), options = list(pageLength = 5))
  # rendering histogram m2
  output$m2_plot <- renderPlot(
    ggplot(data(), aes(m2)) +
      geom_histogram(color = "white", fill = "#78C2AD") +
      geom_vline(aes(xintercept = mean(data()$m2, na.rm = T))) +
      theme_minimal(),
    res = 96
  )

  # rendering histogram prices
  output$price_plot <- renderPlot(
    ggplot(data(), aes(price)) +
      geom_histogram(color = "white", fill = "#78C2AD", bins = 50) +
      scale_x_continuous(labels = function(n) {
        format(n, scientific = FALSE)
      }) +
      geom_vline(aes(xintercept = median(data()$price, na.rm = T))) +
      theme_minimal(),
    res = 96
  )
  # value boxes for m2 : min, max, median, number of observations.
  output$no_obs <- renderValueBox(
    valueBox(data() %>% n_distinct(), subtitle = "no.observations")
  )

  output$median_m2 <- renderValueBox(
    valueBox(median(data()$m2, na.rm = TRUE), subtitle = "Median (m2)", width = 3)
  )
  output$max_m2 <- renderValueBox(
    valueBox(max(data()$m2, na.rm = TRUE), subtitle = "Max (m2)")
  )
  output$min_m2 <- renderValueBox(
    valueBox(min(data()$m2, na.rm = TRUE), subtitle = "Min (m2)")
  )

  # value boxes for prices


  output$median_price <- renderValueBox(
    valueBox(median(data()$price, na.rm = TRUE) %>% format(scientific = F), subtitle = "Median (PLN)", width = 3)
  )
  output$max_price <- renderValueBox(
    valueBox(max(data()$price, na.rm = TRUE) %>% format(scientific = F), subtitle = "Max (PLN)")
  )
  output$min_price <- renderValueBox(
    valueBox(min(data()$price, na.rm = TRUE) %>% format(scientific = F), subtitle = "Min (PLN)")
  )

  # value boxes for prices

  output$img <- renderImage(
    {
      # outfile <- tempfile(fileext = ".png")
      list(
        src = file.path(list.files("./www/img", pattern = paste0("^", stringi::stri_trans_nfd(input$voiv), "(.*)", "$"), full.names = T)),
        alt = "This is sign of voivodship",
        width = 100,
        height = 100
      )
    },
    deleteFile = F
  )
}



