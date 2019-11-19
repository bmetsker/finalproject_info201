chart2 <- function(df){
  plot_map <- plot_ly(
    data = df, 
    x = ~Date,     
    y = ~Volume,         
    type = "bar", 
    alpha = .7,    
    hovertext = "y" 
  ) %>%
    layout(
      title = "Volume Rate of the Stocks",
      xaxis = list(title = "Date"),
      yaxis = list(title = "Volume")
    )
}


