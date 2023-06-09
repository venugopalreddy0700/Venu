rm(list=ls())
cat("\014")

# Load dataset with NA string = ?
dataset = read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")

# Converting the Date and Time variables
dataset$dt = strptime(paste(dataset$Date,dataset$Time),"%d/%m/%Y %H:%M:%S")
dataset$Date = as.Date(dataset$Date,"%d/%m/%Y")

# Subsetting dataset for specified time period: 2007-02-01 and 2007-02-02
datasubset = subset(dataset,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Plot 1: 
png("plot1.png", width=480, height=480)

hist(datasubset$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",main = "Global Active Power",breaks = 15,
     ylim = c(0,1200),xlim = c(0,6))
dev.off()