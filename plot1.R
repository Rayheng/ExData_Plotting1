# Data Science Specialization
# Coursera
# Course: Exploratory Graph
# Author: Heng Rui Jie
# Date: 9th August 2015 SGT
# Title: Course Project 1 Solution
# SubTitle: Plot1.R Source Code

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

png(filename= "./plot1.png")
hist(data3$Global_active_power, breaks = 12 , main = "Global Active Power", col = 'red',  xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()