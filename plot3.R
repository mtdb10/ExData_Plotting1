plot3 <- function(){
        
        library(dplyr)
        library(lubridate)
        url1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url1, "./Data/data.zip")
        unzip("./Data/data.zip")
        
        eletricData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
        eletricData$Date <- as.Date(eletricData$Date, "%d/%m/%Y")
        a <- as.Date("2007-02-01")
        b <- as.Date("2007-02-02")
        eletricUse <-  filter(eletricData, Date <= b & Date >= a)
        
        ####plot3#####
        eletricUse$Global_active_power <- as.numeric(eletricUse$Global_active_power)
        eletricUse$Date_Time <- paste(eletricUse$Date , eletricUse$Time)
        eletricUse$Date_Time <- ymd_hms(eletricUse$Date_Time)
        eletricUse$Sub_metering_1 <- as.numeric(eletricUse$Sub_metering_1)
        eletricUse$Sub_metering_2 <- as.numeric(eletricUse$Sub_metering_2)
        eletricUse$Sub_metering_3 <- as.numeric(eletricUse$Sub_metering_3)
        matplot(eletricUse[,10], eletricUse[,7:9], type = "l", lty = 1, col = c("black", "orangered", "blue"), ylab = "Energy Sub Metering", xlab = "")
        legend("topright", col = c("black", "orangered", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch = "-")
        dev.copy(png, file = "plot3.png")
        dev.off()
        
        
}        