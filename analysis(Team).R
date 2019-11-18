# Load data sources
qtec_df <- data.frame(read.csv("data/First_Trust_NASDAQ_100_Technology_Sector_Index_Fund_05022006_11072019.csv", stringsAsFactors = FALSE))
usd_df <- data.frame(read.csv("data/ProShares_Ultra_Consumer_Goods_02012007_11072019.csv", stringsAsFactors = FALSE))
unfiltered_ffr_df <- data.frame(read.csv("data/Effective_Feceral_Funds_Rate_07011954_10012019.csv", stringsAsFactors = FALSE))

# Create New Columns
qtec_df$Fluctuation <- qtec_df$High - qtec_df$Low
qtec_df$Day_Range <- qtec_df$Close - qtec_df$Open
usd_df$Fluctuation <- usd_df$High - usd_df$Low
usd_df$Day_Range <- usd_df$Close - usd_df$Open
unfiltered_ffr_df$Year <- substr(unfiltered_ffr_df$DATE, 1, 4)
ffr_df <- filter(unfiltered_ffr_df, Year > 2006)

# Install Packages
library(dplyr)
library(ggplot2)
library(plotly)

# Calculations
qtec_avg_fluctuation <- mean(qtec_df$Fluctuation)
usd_avg_fluctuation <- mean(usd_df$Fluctuation)
qtec_avg_day_range <- mean(qtec_df$Day_Range)
usd_avg_day_range <- mean(usd_df$Day_Range)
usd_ltd_volume <- sum(usd_df$Volume)
qtec_ltd_volume <- sum(qtec_df$Volume)
ffr_avg_rate <- mean(ffr_df$FEDFUNDS)
ffr_min_rate <- min(ffr_df$FEDFUNDS)
ffr_max_rate <- max(ffr_df$FEDFUNDS)

# Aggregate Table

qtec_df$Year <- substr(qtec_df$Date, 1, 4)
fqtec_df <- filter(qtec_df, Year > 2006)
usd_df$Year <- substr(usd_df$Date, 1, 4)


summary_interest_rate <- ffr_df %>%
  group_by(Year) %>%
  summarize(
    Ave_FFR = round(mean(FEDFUNDS), digits = 2)
  )

summary_qtec <- fqtec_df %>%
  group_by(Year) %>%
  summarize(
    QTEC_max_vol = max(Volume),
    QTEC_FFR_of_max_vol = High[which(Volume == max(Volume))],
    QTEC_min_vol = min(Volume),
    QTEC_FFR_of_min_vol = High[which(Volume == min(Volume))]
  )

summary_usd <- usd_df %>%
  group_by(Year) %>%
  summarize(
    UGE_max_vol = max(Volume),
    UGE_FFR_of_max_vol = round(High[which(Volume == max(Volume))], digits = 2),
    UGE_min_vol = min(Volume),
    UGE_FFR_of_min_vol = round(High[which(Volume == min(Volume))], digits = 2)
  )

merged_summary_table <- Reduce(merge, list(summary_interest_rate, summary_qtec,  summary_usd))

# Chart 1
#visualizing Federal Interest Rate record of changes from 2006 to 2019

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
    title = "Federal Fund Rate 2006-2019",                
    xaxis = list(title = "Date"),
    yaxis = list(title = "Federal Fund Rate") 
  )

# Chart 2
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


