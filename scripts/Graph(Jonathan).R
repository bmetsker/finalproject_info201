

library("plotly")

fluctuation_plot <- function(dataset) {
  Fluctuation_Scatter <- plot_ly(
    data = dataset,      
    x = ~Date, 
    y = ~Fluctuation, 
    type = "scatter",
    mode = "markers",
    alpha = .7,
    hovertext = "Fluctuation"
  ) %>%
    layout(
      title = "Fluctuation Change (2007 to 2019)",                
      xaxis = list(title = "Date"),
      yaxis = list(title = "Fluctuation") 
    )
}

plot <- fluctuation_plot(qtec_df)
print(plot)
