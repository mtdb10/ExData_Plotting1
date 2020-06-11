plot1 <- function(){
        
        library(dplyr)
        url1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url1, "./Data/data.zip")
        unzip("./Data/data.zip")
        
        eletricData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
        eletricData$Date <- as.Date(eletricData$Date, "%d/%m/%Y")
        a <- as.Date("2007-02-01")
        b <- as.Date("2007-02-02")
        eletricUse <-  filter(eletricData, Date <= b & Date >= a)
        
        ####plot1#####
        eletricUse$Global_active_power <- as.numeric(eletricUse$Global_active_power)
        hist(eletricUse$Global_active_power, xlab = "Global Active Power (Kiowatts)", col = "orangered", main = "Global Active Power")
        dev.copy(png, file = "plot1.png")
        dev.off()
        
  
}