qtec_df <- data.frame(read.csv("data/First_Trust_NASDAQ_100_Technology_Sector_Index_Fund_05022006_11072019.csv", stringsAsFactors = FALSE))

chart2_tech <- plot_ly(
  data = qtec_df, 
  x = ~Date,     
  y = ~Open,
  type = "scatter",
  mode = "lines",
  alpha = .7,    
  hovertext = "y" 
) %>%
  layout(
    title = "QTECH Index Fund",
    xaxis = list(title = "Date"),
    yaxis = list(title = "Open rate")
  )
