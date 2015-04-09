# Code digitally signed - DigiCert

# Exploratory Data Analysis
# Course Project 1
# plot2.R

setwd("C:/Coursera/Exploratory Data Analysis/Project 1")

# Load data file for project 1
project1Data <- read.table("household_power_consumption.txt",sep = ";", header=TRUE, stringsAsFactors = FALSE, na.strings = "?")

# Translate the date column value to an actual date class type 
# example: 16/12/2006 gets converted to 2006-12-16
project1Data$Date <- as.Date(project1Data$Date, "%d/%m/%Y")

# Now create a subset with only the  dates 2007-02-01 and 2007-02-02.
project1DataSubset <- subset(project1Data, Date >= "2007-02-01" & Date <= "2007-02-02")

#Create a new column with both date and time:
# example: "2007-02-01 00:01:00"
dateANDtime <- paste(as.Date(project1DataSubset$Date), project1DataSubset$Time)

# example: "2007-02-01 00:01:00 CST"
project1DataSubset$dateANDtime <- strptime(dateANDtime, "%Y-%m-%d %H:%M:%S")

# Open a png graphics device to save the image
png("plot2.png", width = 480, height = 480)

# Now generate the plot
plot(project1DataSubset$dateANDtime, project1DataSubset$Global_active_power, 
     xlab="", ylab = "Global Active Power (kilowatts)",type="l")

# Finally close the graphics device
dev.off()