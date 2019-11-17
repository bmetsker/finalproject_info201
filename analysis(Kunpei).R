

#Create a variable that represent the Federal Fund Rate Change file 
Fed_rate <- read.csv("Effective_Feceral_Funds_Rate_07011954_10012019.csv", stringsAsFactors = FALSE)

library("ggplot2")
library("plotly")

#visualizing Federal Interest Rate record of changes from 1954 to 2019


Federal_rate_change <- plot_ly(
  data = Fed_rate,      
  x = ~DATE, 
  y = ~FEDFUNDS, 
  type = "scatter",
  mode = "lines",
  alpha = .7,
  hovertext = "FEDFUNDs"
) %>%
  layout(
    title = "Federal Interest Rate record of changes from 1954 to 2019",                
    xaxis = list(title = "Date"),
    yaxis = list(title = "Federal Fund Interest Rate") 
  )
