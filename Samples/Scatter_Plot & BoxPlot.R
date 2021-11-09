read.csv("C:/Users/paxton.proctor/Downloads/Office_Supplies.csv")
#This is just a example to show how to make a line chart using R_Script

## line chart for the Amtrak data
temp.df <- read.csv("C:/Users/paxton.proctor/Downloads/Office_Supplies.csv")

## Scatterplot with axes names
plot(temp.df$Units - temp.df$Unit.Price, xlab = "Units", ylab = "Unit.Price")
# alternative plot with ggplot
library(ggplot2)
ggplot(temp.df) + geom_point(aes(x = Units, y = Unit.Price), colour = "Navy", alpha = 0.7)
mean(temp.df[["Units"]])
library("matrixStats")
weightedMedian(temp.df[["Unit.Price"]], w=temp.df[["Units"]])

# Box Plots
boxplot(temp.df[["Units"]]/1000,ylab="Units(millions)")
breaks <- seq(from=min(temp.df[["Units"]]),
to=max(temp.df[["Units"]]), length=11)
pop_freq <- cut(temp.df[["Units"]], breaks-breaks,
right=TRUE, include.lowest = TRUE)
table(pop_freq)
