data <- read.csv("data/First_Trust_NASDAQ_100_Technology_Sector_Index_Fund_05022006_11072019.csv", stringsAsFactors = FALSE)

library("ggplot2")

plot <- ggplot(data = data) +
  geom_point(mapping = aes(
    x = Date, 
    y = Adj.Close
    ))  

plot <- ggplot(data = data) +
  geom_point(mapping = aes(
    x = Date, y = Adj.Close)) +
  geom_smooth(x = Date, y = Adj.Close, method = y~poly(x,6), se = TRUE, fullrange = FALSE, level = 0.95)
