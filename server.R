
server <- function(input, output) {
  
  output$homes <- renderDataTable(new_homes,options = list(pageLength = 10))
}