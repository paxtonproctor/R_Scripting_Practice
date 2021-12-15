mydata.df <- read.csv("Z:/Analytics/Paxton/Countries/Testing.csv")

mydata.df$time = ifelse(mydata.df$year >= 2000, 1, 0)

mydata.df$treated = ifelse(mydata.df$Country == "A" | mydata.df$Country == "B" | mydata.df$Country == "C", 1, 0)

mydata.df$did = mydata.df$year * mydata.df$Country

didreg = lm(y ~ year + Country + did, data = mydata.df)
summary(didreg)
