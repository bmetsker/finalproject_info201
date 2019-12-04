#Code for CHart 1: 

#Create a variable that represent the Federal Fund Rate Change file 

library("ggplot2")
library("plotly")
library("dplyr")

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

#Shiny scripts for final deliverable--Fluctuation of Consumer Goods Index

library("ggplot2")
library("plotly")
library("dplyr")


createDataFrame <- function(col) {
  
  FederalFund <- read.csv("data/Effective_Feceral_Funds_Rate_07011954_10012019.csv", stringsAsFactors = FALSE)
  
  colnames(FederalFund) <- c("Date", "FedFunds")
  
  Technology1 <- read.csv("data/First_Trust_NASDAQ_100_Technology_Sector_Index_Fund_05022006_11072019.csv", stringsAsFactors = FALSE) 
  
  Technology <- Technology1 %>%
    mutate(Fluctuation = Technology1$High - Technology1$Low) %>%
    select(Date, Fluctuation)
  
  colnames(Technology) <- c("Date", paste("Technology Fluctuation"))
  
  
  ConsumerGoods1 <- read.csv("data/ProShares_Ultra_Consumer_Goods_02012007_11072019.csv", stringsAsFactors = FALSE) 
  
  ConsumerGoods <-ConsumerGoods1 %>%
    mutate(Fluctuation = ConsumerGoods1$High - ConsumerGoods1$Low) %>%
    select(Date, Fluctuation)
  
  colnames(ConsumerGoods) <- c("Date", paste("ConsumerGoods Fluctuation"))
  
  Healthcare1 <- read.csv("data/VHT.csv", stringsAsFactors = FALSE) 
  
  Healthcare <- Healthcare1 %>%
    mutate(Fluctuation = Healthcare1$High - Healthcare1$Low) %>%
    select(Date, Fluctuation)
  
  colnames(Healthcare) <- c("Date", paste("Healthcare Fluctuation"))
  
  RealEstate1 <- read.csv("data/ICF.csv", stringsAsFactors = FALSE) 
  RealEstate <- RealEstate1 %>%
    mutate(Fluctuation = RealEstate1$High - RealEstate1$Low) %>%
    select(Date, Fluctuation)
  
  colnames(RealEstate) <- c("Date", paste("RealEstate Fluctuation"))
  
  DataFrame <- ConsumerGoods %>%
    inner_join(Technology) %>%
    inner_join(Healthcare) %>%
    inner_join(RealEstate) %>%
    inner_join(FederalFund)
}


#Pot for industry index fluctuation 

fluctuationCompareGraph <- function(date1, date2, inputVector, ourData) {
  
  range <- filter(ourData, Date >= date1 & Date <= date2)
  
  fluctuationInDifferentIndustry <- plot_ly(range) %>%
    add_trace(
    x = ~Date,
    y = ~FedFunds,
    type = "scatter",
    mode = "lines",
    alpha = .7,
    hovertext = "Fluctuation Rate",
    fill = "tozeroy"
  ) %>%
  layout(
    title = "Industry Index Fluctuation",                
    xaxis = list(title = "Date"),
    yaxis = list(title = "Fluctuation Rate")
  )
  
  if(!is.null(inputVector)) {
    for(i in 1: length(inputVector)) {
      y_val <- range[[paste0(inputVector[i], " Fluctuation")]]
      fluctuationInDifferentIndustry <- fluctuationInDifferentIndustry %>% add_trace(
        x = ~Date,
        y = y_val,
        name = inputVector[i],
        type = "scatter",
        mode = "lines",
        alpha = .7,
        hovertext = "Fluctuation Rate",
        fill = 'tozeroy'
      )
    }
    
  }
  return (fluctuationInDifferentIndustry) 
}


FluctuationData <- createDataFrame("Fluctuation")

