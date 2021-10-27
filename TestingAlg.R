# Paxton Proctor
# 10/26/2021
#
# This Program is just for opening, loading, and creating stuff within
# a file. This will be useful for when accessing data that will be manipulated
# or accessed.
#
# when using a file from Power BI, IBM SPSS Statistics, or Excel. It is best
# to change the file to a csv(comma separated value) file. To save the file
# got to File > Save as > Save as type: CSV (Comma delimited) (*.csv) > Save.

# Beware when dealing with .csv files in Excel
# Opening a .csv file in Excel strips off leading 0's. which corrupts zipcode
# data.
# Saving a .csv file in Excel saves only the digits that are displayed; if you
# need precision to a certain number of decimals, you need to ensure they are
# displayed before saving.

# Example
housing.df <- read.csv("WestRoxbury.csv", header = True) # load data
dim(housing.df) # find the dimensions of data frame
head(housing.df) # show the first six rows
View(housing.df) # show all the data in a new tab

#Practice showing different subsets of the data
housing.df[1:10, 1] # show the first 10 rows of the first columns only
housing.df[1:10, ] # show the first 10 rows of each of the columns only
housing.df[5, 1:10] # show the fifth row of the first 10 columns
housing.df[5, c(1:2, 4, 8:10)] # show the fifth row of some columns
housing.df[ ,1] # show the whole first column
housing.df$TOTAL_VALUE # a different way to show the whole first column
housing.df$TOTAL_VALUE[1:10] # show the first 10 rows of the first column
length(housing.df$TOTAL_VALUE) # find the length of the first column
mean(housing.df$TOTAL_VALUE) # find the mean of the first column
summary(housing.df) # find summary statistics for each columns


# Note: data frame is housing.df A data frame has rows and columns. Rows are the observations for each case (house) and the columns are the variables of interest (TOTAL VALUE, Tax).

# sampling code over/under-sampling
# random sample of 5 operations
s <- sample(row.names(housing.df), 5)
housing.df[s,]
#oversample houses wtih over 10 rooms
s <- sample(row.names(housing.df), 5, prob = ifelse(housing.df$ROOMS>10, 0.9, 0.01))
housing,df[s,]

# code for reviewing variables
names(housing.df) # print a list of variables to the screen.
t(t(names(housing.df))) # print the list in a useful column formal
colnames(housing.df) [1] <- c("TOTAL_VALUE") # change the first column's names
class(housing.df$REMODEL) # REMODEL is a factor variables
class(housing.df[ ,14]) # same.
levels(housing.df[, 14]) # It can take one of three levels
class(housing.df$BEDROOMS) # BEDROOMS is an integer variables
class(housing.df[, 1]) # Total_Value is a numeric variables

# code for creating binary dummies(indicators)
# use model.matrix() to convert all categorial variables in the data frame into a set of dummy variables. We must then turn the resulting data matrix back into a data frame for further work.
xtotal <- model.matrix(- 0 + BEDROOMS + REMODEL, data = housing.df)
xtotal$BEDROOMS[1:5] # will not work because xtotal is a matrix
xtotal <- as.data.frame(xtotal)
t(t(names(xtotal))) # check the names of the dummy variables
head(xtotal)
xtotal <- xtotal[, -4] # drop one of the dummy variables.
# In this case, drop REMODELRecent.

# code for imputing missing data with median
# to illustrate missing data procedures, we first convert a few entries for bedrooms to NA's. Then we impute these missing values using the median of the remaining values.
rows.to.missing <- sample(row.names(housing.df), 10)
housing.df[rows.to.missing,]$BEDROOMS <- NA
summary(housing.df$BEDROOMS) # Now we have 10 NA's and the median of the remaining values is 3.
# replace the missing values using the median of the remaining values.
# use median() with na.rm = TRUE to ignore missing values when computing the median.
housing,df[rows.to.missing,]$BEDROOMS <- median(housing.df$BEDROOMS, na.rm = TRUE)
summary(housing.df$BEDROOMS)
