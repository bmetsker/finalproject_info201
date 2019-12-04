library("ggplot2")
library("plotly")
library("dplyr")

createDataFrame <- function(col) {
  
  
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
    inner_join(Technology) %>%
    inner_join(Healthcare) %>%
    inner_join(RealEstate)
}


VolumeGraph <- function(date1, date2, col, df) {
  
  range <- filter(df, Date >= date1 & Date <= date2) 
  
  Volume_Change_Graph <- plot_ly(
    data = range, 
    x = ~Date,     
    y = range[[col]],         
    type = "bar", 
    alpha = .7,    
    hovertext = "y" 
  ) %>%
    layout(
      title = "Volume Rate of the Stocks",
      xaxis = list(title = "Date"),
      yaxis = list(title = paste(col))
    )
  
}

VolumeData <- createDataFrame("Volume")
