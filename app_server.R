library("ggplot2")
library("plotly")
library("dplyr")

source("Metric1Analysis.R")

server <- function(input, output) {
  output$Metric1Graph <- renderPlotly(
    FedCompareGraph(input$Metric1Date[1], input$Metric1Date[2], paste(input$Metric1Stock,"Adj.Close"), AdjData)
  )
    
    
}
#ouput$popchart <- FedCompareGraph(output$Metric1Date[1], output$Metric1Date[2], paste(output$Metric1Stock, "Adj.Close"), AdjData)