## Course Project 1 - Plot 3
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

##Change the language 
Sys.setlocale("LC_TIME", "English")

##Create graphic
png(filename = "plot3.png",width = 480, height = 480)

plot(dt$dateTime,dt$Sub_metering_1, type ="n", 
     ylab = "Energy sub metering", xlab ="")

points(dt$dateTime,dt$Sub_metering_1,col="black", type = "l")
points(dt$dateTime,dt$Sub_metering_2,col="red", type = "l")
points(dt$dateTime,dt$Sub_metering_3,col="blue", type = "l")

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lwd=1, lty=c(1,1), col = c("black","red","blue"))

dev.off()