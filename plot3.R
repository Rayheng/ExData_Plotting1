# Data Science Specialization
# Coursera
# Course: Exploratory Graph
# Author: Heng Rui Jie
# Date: 9th August 2015 SGT
# Title: Course Project 1 Solution
# SubTitle: Plot3.R Source Code

# Library Initialization and load
# install.packages('dplyr')
# library(dplyr)

# Assume directory is set to the file path where data is
# setwd("/Users/kilopy82/GitHub/ExData_Plotting1")
initial <- read.table("household_power_consumption.txt" , header=TRUE, sep=';', na.strings="?", nrow = 100)
classes <- sapply(initial, class)
data <- read.table("household_power_consumption.txt" , header=TRUE, sep=';', na.strings="?", colClasses = classes)

data2 <- mutate(data , DT = as.Date(Date, "%d/%m/%Y"))
data3 <- filter(data2, DT >= "2007-02-01" & DT <= "2007-02-02")
data3$TS <- strptime( paste(data3$Date, data3$Time) , "%d/%m/%Y %H:%M:%S" )


png(filename= "./plot3.png")
# hist(data3$Global_active_power, breaks = 12 , main = "Global Active Power", col = 'red',  xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
# plot(x=data3$TS, y=data3$Global_active_power, xlab = "" , ylab = "Global Reactive Power(kilowatts)", type = 'n')
# lines(x=data3$TS, y=data3$Global_active_power)

plot(x=data3$TS, y=data3$Sub_metering_1, xlab = "" , ylab = "Energy Sub Metering", type = 'n')
lines(x=data3$TS, y=data3$Sub_metering_1, col="black")
lines(x=data3$TS, y=data3$Sub_metering_2, col="red")
lines(x=data3$TS, y=data3$Sub_metering_3, col="blue")

legend("topright" , lty=c(1,1,1), col=c("black","red","blue") , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()