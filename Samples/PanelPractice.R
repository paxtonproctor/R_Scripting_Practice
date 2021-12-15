library(foreign)
library(car)

mydata.df <- read.csv("Z:/Analytics/Paxton/Countries/Testing.csv")

coplot(y ~ year|Country, type="l", data=mydata.df)
coplot(y ~ year|Country, type="b", data=mydata.df)

scatterplot(y ~ year|Country, boxplots=FALSE, smooth=TRUE, reg.line=FALSE, data=mydata.df)

mydata.df$time = ifelse(mydata.df$year >= 2000, 1, 0)

mydata.df$treated = ifelse(mydata.df$Country == "A" | mydata.df$Country == "B" | mydata.df$Country == "C", 1, 0)

mydata.df$did = mydata.df$year * mydata.df$Country

didreg = lm(y ~ year + Country + did, data = mydata.df)
summary(didreg)
