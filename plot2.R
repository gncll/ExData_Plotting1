library(datasets)
library(dplyr)

datafile <- "./household_power_consumption.txt"

bigdata <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

bigdatasub <- bigdata[bigdata$Date %in% c("1/2/2007", "2/2/2007"), ]

datetime <- strptime(paste(bigdatasub$Date, bigdatasub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(bigdatasub$Global_active_power)

png("plot2.png", width=480, height=480)

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off( )
