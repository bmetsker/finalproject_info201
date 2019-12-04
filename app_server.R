library("ggplot2")
library("plotly")
library("dplyr")

source("Metric1Analysis.R")
source("Metric2Analysis.R")

server <- function(input, output) {
  output$Metric1Graph <- renderPlotly(
    FedCompareGraph(input$Metric1Date[1], input$Metric1Date[2], paste(input$Metric1Stock,"Adj.Close"), AdjData)
  )
  output$Metric2Graph <- renderPlotly(
    VolumeGraph(input$Metric2Date[1], input$Metric2Date[2], paste(input$Metric2Stock,"Volume"), VolumeData)
  )
    
}
