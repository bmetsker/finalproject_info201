
library("ggplot2")
library("plotly")
library("dplyr")

createDataFrame <- function(col) {

  FederalFund <- read.csv("data/Effective_Feceral_Funds_Rate_07011954_10012019.csv", stringsAsFactors = FALSE)
  
  colnames(FederalFund) <- c("Date", "FedFunds")
  
  
  Technology <- read.csv("data/First_Trust_NASDAQ_100_Technology_Sector_Index_Fund_05022006_11072019.csv", stringsAsFactors = FALSE) %>%
    select(Date, col)
  
  colnames(Technology) <- c("Date", paste("Technology", col))
  
  
  ConsumerGoods <- read.csv("data/ProShares_Ultra_Consumer_Goods_02012007_11072019.csv", stringsAsFactors = FALSE) %>%
    select(Date, col)
  
  colnames(ConsumerGoods) <- c("Date", paste("ConsumerGoods", col))
  
  Healthcare <- read.csv("data/VHT.csv", stringsAsFactors = FALSE) %>%
    select(Date, col)
  
  colnames(Healthcare) <- c("Date", paste("Healthcare", col))
  
  RealEstate <- read.csv("data/ICF.csv", stringsAsFactors = FALSE) %>%
    select(Date, col)
  
  colnames(RealEstate) <- c("Date", paste("RealEstate", col))

  DataFrame <- ConsumerGoods %>%
    inner_join(FederalFund) %>%
    inner_join(Technology) %>%
    inner_join(Healthcare) %>%
    inner_join(RealEstate)
}


FedCompareGraph <- function(date1, date2, col, ourData) {
  
  range <- filter(ourData, Date >= date1 & Date <= date2)
  
  Federal_rate_change <- plot_ly(range) %>% 
    add_lines(    
      x = ~Date,
      y = range[[col]],
      name = col,
      yaxis = "y") %>% 
    add_lines(
      x = ~Date,
      y = ~FedFunds,
      yaxis = "y2",
      name = "FedFunds Interest Rate") %>%
    layout(
      title = "Federal Interest Rate Comparison",                
      xaxis = list(title = "Date"),
      yaxis = list(title = paste(col, "Interest Rate")),
      yaxis2 = list(
        tickfont = list(color = "orange"),
        overlaying = "y",
        side = "right",
        title = "FedFunds Interest Rate",
        rangemode = "tozero"
        )
    ) 
 
}

AdjData <- createDataFrame("Adj.Close")
