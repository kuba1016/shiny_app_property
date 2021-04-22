tab_map <- function(){
  tabPanel(
    h5("Map"),
    sliderInput("obs", "Number of observations:", min = 10, max = 500, value = 100)
  )
  
}
