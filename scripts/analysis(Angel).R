# Install Packages
library(dplyr)

# Load data sources
qtec_df <- data.frame(read.csv("data/First_Trust_NASDAQ_100_Technology_Sector_Index_Fund_05022006_11072019.csv", stringsAsFactors = FALSE))
usd_df <- data.frame(read.csv("data/ProShares_Ultra_Consumer_Goods_02012007_11072019.csv", stringsAsFactors = FALSE))
unfiltered_ffr_df <- data.frame(read.csv("data/Effective_Feceral_Funds_Rate_07011954_10012019.csv", stringsAsFactors = FALSE))

#Create New Column for Federal Rate
unfiltered_ffr_df$Year <- substr(unfiltered_ffr_df$DATE, 1, 4)
ffr_df <- filter(unfiltered_ffr_df, Year > 2006)
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
