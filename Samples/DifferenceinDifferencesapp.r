library(foreign)
library(car)

mydata.df <- read.csv("somefile.csv")

#coplot(Y ~ N | Year * mydata.df$HS, type="l", data=mydata.df)
#coplot(Y ~ Year | mydata$HS, type="b", data=mydata.df)


#scatterplot(Y ~ Year | mydata.df$HS, boxplots=FALSE, smooth=TRUE, reg.line=FALSE, data=mydata.df)

mydata.df$treated = ifelse(mydata.df$Nalt > 0, 1, 0)

mydata.df$did = mydata.df$Year * mydata.df$Nalt

didregEnr = lm(Y ~ treated + Year + did, data = mydata.df)
didregApp = lm(App ~ treated + Year + did, data = mydata.df)

summary(didregY)
summary(didregApp)
