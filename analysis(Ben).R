# Load data sources
qtec_df <- data.frame(read.csv("data/First_Trust_NASDAQ_100_Technology_Sector_Index_Fund_05022006_11072019.csv", stringsAsFactors = FALSE))
usd_df <- data.frame(read.csv("data/ProShares_Ultra_Consumer_Goods_02012007_11072019.csv", stringsAsFactors = FALSE))
ffr_df <- data.frame(read.csv("data/Effective_Feceral_Funds_Rate_07011954_10012019.csv", stringsAsFactors = FALSE))

# Create New Columns
qtec_df$Fluctuation <- qtec_df$High - qtec_df$Low
qtec_df$Day_Range <- qtec_df$Close - qtec_df$Open
usd_df$Fluctuation <- usd_df$High - usd_df$Low
usd_df$Day_Range <- usd_df$Close - usd_df$Open
