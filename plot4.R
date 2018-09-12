library(datasets)
library(dplyr)

setwd("/Users/randyasfandy/Desktop/Data Science/John Hopkins Data Science/Exploratory Data Analysis")
#To set working directory
bigdata <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#To read file.
datafile <- "./household_power_consumption.txt"
#To define way of file
bigdata <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#To read file
bigdatasub <- bigdata[bigdata$Date %in% c("1/2/2007", "2/2/2007"), ]
#To subset date
datetime <- strptime(paste(bigdatasub$Date, bigdatasub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#To create days.
globalActivePower <- as.numeric(bigdatasub$Global_active_power)
#To fix format.
globalReactivePower <- as.numeric(bigdatasub$Global_reactive_power)
#To fix format.
Voltage <- as.numeric(bigdatasub$Voltage)
#To fix format.
subMetering1 <- as.numeric(bigdatasub$Sub_metering_1)
#To fix format.
subMetering2 <- as.numeric(bigdatasub$Sub_metering_2)
#To fix format.
subMetering3 <- as.numeric(bigdatasub$Sub_metering_3)
#To fix format.
globalReactivePower <- as.numeric(bigdatasub$Global_reactive_power)
#To fix format.
png("plot4.png", width = 480, height = 480)
#To save this graphics as a png file with given features.
par(mfrow = c(2,2), mar = c(4,4,2,1))
#To set up layout.
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#First plot.
plot(datetime, Voltage, type="l", xlab="datetime")
#Second plot.
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#Third plot.
plot(datetime, globalReactivePower, type="l", xlab="datetime")
#Fourth plot.
dev.off()
#To indicate finishing.



