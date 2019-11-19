

#Create a variable that represent the Federal Fund Rate Change file 
unfiltered_ffr_df <- data.frame(read.csv("data/Effective_Feceral_Funds_Rate_07011954_10012019.csv", stringsAsFactors = FALSE))
unfiltered_ffr_df$Year <- substr(unfiltered_ffr_df$DATE, 1, 4)
ffr_df <- filter(unfiltered_ffr_df, Year >= 2006)

library("ggplot2")
library("plotly")

#visualizing Federal Interest Rate record of changes from 1954 to 2019


Federal_rate_change <- plot_ly(
  data = ffr_df,      
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
