#Code for CHart 1: 

#Create a variable that represent the Federal Fund Rate Change file 

library("ggplot2")
library("plotly")

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

FederalFund <- read.csv("data/Effective_Feceral_Funds_Rate_07011954_10012019.csv", stringsAsFactors = FALSE)

colnames(FederalFund) <- c("Date", "FedFunds")

Nasdaq <- read.csv("data/First_Trust_NASDAQ_100_Technology_Sector_Index_Fund_05022006_11072019.csv", stringsAsFactors = FALSE) %>%
  select(Date, Adj.Close)

colnames(Nasdaq) <- c("Date", "Nasdaq Adj.Close")

ConsumerGoods <- read.csv("data/ProShares_Ultra_Consumer_Goods_02012007_11072019.csv", stringsAsFactors = FALSE) %>%
  select(Date, Adj.Close)

colnames(ConsumerGoods) <- c("Date", "ProShares Adj.Close")

ourData <- ConsumerGoods %>%
  inner_join(FederalFund) %>%
  inner_join(Nasdaq)

####################################################################

FluctuationInDifferentIndustry <- plot_ly(
  data = ourData,      
  x = ~Date,
  y = ourData[[col]],
  type = "scatter",
  mode = "lines",
  alpha = .7,
  hovertext = "Fluctuation Rate"
)
layout(
  title = "Industry Index Fluctuation",                
  xaxis = list(title = "Date"),
  yaxis = list(title = "Index Rate of Change ")
)


