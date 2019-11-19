#Code for CHart 1: 

#Create a variable that represent the Federal Fund Rate Change file 

library("ggplot2")
library("plotly")

#visualizing Federal Interest Rate record of changes from 1954 to 2019
fed_fund_plot <- function(dataset) {

  Federal_rate_change <- plot_ly(
    data = dataset,      
    x = ~DATE, 
    y = ~FEDFUNDS, 
    type = "scatter",
    mode = "lines",
    alpha = .7,
    hovertext = "FEDFUNDs"
  ) %>%
    layout(
      title = "Federal Interest Rate record of changes from 2006 to 2019",                
      xaxis = list(title = "Date"),
      yaxis = list(title = "Federal Fund Interest Rate") 
    )
}

