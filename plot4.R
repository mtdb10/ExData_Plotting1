plot4 <- function(){
        
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
        par(mfrow = c(2,2))
        par(mai=c(0.7,0.7,0.2,0.1))
        
        ####plot1#####
        eletricUse$Global_active_power <- as.numeric(eletricUse$Global_active_power)
        eletricUse$Date_Time <- paste(eletricUse$Date , eletricUse$Time)
        eletricUse$Date_Time <- ymd_hms(eletricUse$Date_Time)
        plot(eletricUse$Date_Time, eletricUse$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
        
        ####plot2#####
        eletricUse$Voltage <- as.numeric(eletricUse$Voltage)
        plot(eletricUse$Date_Time, eletricUse$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        
        
        ####plot3#####
        eletricUse$Sub_metering_1 <- as.numeric(eletricUse$Sub_metering_1)
        eletricUse$Sub_metering_2 <- as.numeric(eletricUse$Sub_metering_2)
        eletricUse$Sub_metering_3 <- as.numeric(eletricUse$Sub_metering_3)
        matplot(eletricUse[,10], eletricUse[,7:9], type = "l", lty = 1, col = c("black", "orangered", "blue"), ylab = "Energy Sub Metering", xlab = "")
        legend("topright", col = c("black", "orangered", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch = "-")
        
        #####plot4####
        eletricUse$Global_reactive_power <- as.numeric(eletricUse$Global_reactive_power)
        plot(eletricUse$Date_Time, eletricUse$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
        
        dev.copy(png, file = "plot4.png")
        dev.off()
        
}