library("ggplot2")
library("plotly")
library("dplyr")

source("Metric1Analysis.R")
source("Matric3Analysis.R")

server <- function(input, output) {
  output$Metric1Graph <- renderPlotly(
    FedCompareGraph(input$Metric1Date[1], input$Metric1Date[2], paste(input$Metric1Stock,"Adj.Close"), AdjData)
  )
    
    
}