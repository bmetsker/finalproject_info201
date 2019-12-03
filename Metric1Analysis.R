
library("ggplot2")
library("plotly")
library("dplyr")

FederalFund <- read.csv("data/Effective_Feceral_Funds_Rate_07011954_10012019.csv", stringsAsFactors = FALSE)

colnames(FederalFund) <- c("Date", "FedFunds")


Nasdaq <- read.csv("data/First_Trust_NASDAQ_100_Technology_Sector_Index_Fund_05022006_11072019.csv", stringsAsFactors = FALSE) %>%
  select(Date, Adj.Close)

colnames(Nasdaq) <- c("Date", "Nasdaq Adj.Close")


ConsumerGoods <- read.csv("data/ProShares_Ultra_Consumer_Goods_02012007_11072019.csv", stringsAsFactors = FALSE) %>%
  select(Date, Adj.Close)

colnames(ConsumerGoods) <- c("Date", "ProShares Adj.Close")


AdjData <- ConsumerGoods %>%
  inner_join(FederalFund) %>%
  inner_join(Nasdaq)


FedCompareGraph <- function(date1, date2, col, ourData) {
  
  range <- filter(ourData, Date >= date1 & Date <= date2)
  
  ay <- list(
    tickfont = list(color = "red"),
    overlaying = "y",
    side = "right",
    title = "second y axis"
  )
  
  Federal_rate_change <- plot_ly(range) %>% 
    add_lines(    
      x = ~Date,
      y = range[[col]],
      name = col) %>% 
    add_lines(
      x = ~Date,
      y = ~FedFunds,
      yaxis = "y2",
      name = 'FederalFund') %>%
    layout(
      title = "Federal Interest Rate Compare",                
      xaxis = list(title = "Date"),
      yaxis2 = ay
    ) 
 
}
