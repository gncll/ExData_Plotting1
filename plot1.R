library(datasets)
library(dplyr)

setwd("/Users/randyasfandy/Desktop/Data Science/John Hopkins Data Science/Exploratory Data Analysis")

#To set working directory properly.

bigdata <-  read.csv("/Users/randyasfandy/Desktop/Data Science/John Hopkins Data Science/Exploratory Data Analysis/household_power_consumption.txt",header = TRUE, sep = ";", dec = " ", na.strings = "TRUE")

#To read bigdata, without ';' and ' ' by the help of sep and dec arguments.

bigdata <- na.omit(bigdata)

#To get rid of NA's.

bigdata$Date <- as.Date(strptime(bigdata$Date,format="%d/%m/%Y"))

# To changing Date columns format to date for filtering in next step.

bigdata <- subset(bigdata, Date >= "2007-02-01" & Date <= "2007-02-02")

# To filtering date in date format.


bigdata <- bigdata %>% mutate(Days = ifelse(Date == "2007-02-02", "Friday", "Thursday"))

# To create new variable as Days.

bigdata$Days <- as.factor(bigdata$Days)

# For changing Days columns format to proper to plotting.


bigdata$Global_active_power <- as.numeric(as.character(bigdata$Global_active_power))

# To changing factor to numeric


hist(bigdata$Global_active_power, xlab =  "Global Active Power(kilowatts)", col = "red", main = "Global Active Power")

# To draw histogram with specified features.





