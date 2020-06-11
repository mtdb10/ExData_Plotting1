plot2 <- function(){
        
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
        
        ####plot2#####
        eletricUse$Global_active_power <- as.numeric(eletricUse$Global_active_power)
        eletricUse$Date_Time <- paste(eletricUse$Date , eletricUse$Time)
        eletricUse$Date_Time <- ymd_hms(eletricUse$Date_Time)
        plot(eletricUse$Date_Time, eletricUse$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
        dev.copy(png, file = "plot2.png")
        dev.off()
        
}