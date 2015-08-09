# Project 1 for Exloratory Data Analysis Course
# Plot 3
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

# Plot 3
png(filename = "plot3.png")
plot(pwrDFS$Date_Time,pwrDFS[,7], type="l",xlab="",ylab= "Energy sub mettering", main = "", col= "black")
lines(pwrDFS$Date_Time,pwrDFS[,8], col="red")
lines(pwrDFS$Date_Time,pwrDFS[,9], col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
