## Course Project 1 - Plot 1
## Autor: Gabriel
## Date: 08/10

##Add the date library
library(lubridate)

##Download and unzip data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = fileUrl, destfile = "./project1.zip")
unzip("./project1.zip")

##Read and transform data
data <- read.table(file = "./household_power_consumption.txt",
                   header = TRUE, sep = ";", na.strings = '?',
                   colClasses= c("character", "character", 
                                 "numeric", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", 
                                 "numeric"))

dt <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007" ,]
dt["dateTime"] <- dmy_hms(paste(dt$Date, dt$Time))

##Create graphic
png(filename = "plot1.png",width = 480, height = 480)

hist(dt$Global_active_power,xlab = "Global Active Power (kilowatts)",
     col="red" , main = "Global Active Power")

dev.off()
