#This is just a example to show how to make a line chart using R_Script

## line chart for the Amtrak data
Amtrak.df <- read.csv("Amtrak.csv")

# use time series analysis
library(forecast)
ridership.ts <-(Amtrak.df$Ridership, start = c(1991, 1), end = c(2004, 3), freq = 12)
plot(ridership.ts, xlab = "Year", ylab = "Ridership (in 000s)", ylim = c(1300,2300))
