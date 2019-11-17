library("dplyr")

get_summary_info <- function(dataset) {
  return <- list()

  return$columns <- length(dataset)
  
  return$rows <- nrow(dataset)
  
  return$max <- dataset %>%
    select(Date, Adj.Close) %>%
    filter(Adj.Close == max(Adj.Close))
  
  return$min <- dataset %>%
    select(Date, Adj.Close) %>%
    filter(Adj.Close == min(Adj.Close))
  
  return$avg <- dataset %>%
    select(Adj.Close) %>%
    summarise(mean(Adj.Close))
  
  return$slopeHigh <- dataset %>%
    select(Date, Open, Close) %>%
    mutate(Monthly_Change = Close - Open) %>%
    select(Date, Monthly_Change) %>%
    filter(Monthly_Change == max(Monthly_Change))
  
  return$slopeLow <- dataset %>%
    select(Date, Open, Close) %>%
    mutate(Monthly_Change = Close - Open) %>%
    select(Date, Monthly_Change) %>%
    filter(Monthly_Change == min(Monthly_Change))
  
  return(return)
}
