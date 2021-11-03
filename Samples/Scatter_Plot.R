# This R_Script is an example of getting a scatterplot

## Boston housing data
housing.df <- read.csv("BostonHousing.csv")

## Scatterplot with axes names
plot(housing.df$MEDV - housing.df$LSTAT, xlab = "LSTAT", ylab = "MEDV")
# alternative plot with ggplot
library(ggplot2)
ggplot(housing.df) + geom_point(aes(x = LSTAT, y = MEDV), colour = "Navy", alpha = 0.7)
