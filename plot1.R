# Project 1 for Exloratory Data Analysis Course
# Plot 1
# Due 08/09/2015
# Databasse = household_power_consumption.txt

# Read database
setwd("~/Documents/Coursera Big Data Spec/R")
pwrDF<-read.csv2("household_power_consumption.txt", na.string="?",colClasses = "character")

# Set date column to proper format
pwrDF$Date<- as.Date(pwrDF$Date, "%d/%m/%Y")
# Subset to relevant data
pwrDFS<-subset(pwrDF, pwrDF$Date > "2007-1-31" & pwrDF$Date < "2007-2-3")
#Combine Date and Time and add new column
pwrDFS$Date_Time <- strptime(paste (pwrDFS$Date,pwrDFS$Time), "%Y-%m-%d %H:%M:%S")

# Change columns to numeric for calculations
pwrDFS[,3]<- as.numeric(pwrDFS[,3])
pwrDFS[,4]<- as.numeric(pwrDFS[,4])                               
pwrDFS[,5]<- as.numeric(pwrDFS[,5])
pwrDFS[,7]<- as.numeric(pwrDFS[,7])
pwrDFS[,8]<- as.numeric(pwrDFS[,8])
pwrDFS[,9]<- as.numeric(pwrDFS[,9])

#Plot 1
png(filename = "plot1.png")
hist(pwrDFS$Global_active_power, xlab= "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()

