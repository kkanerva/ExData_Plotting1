# This would be the smart way to do this:
# source("load_data.R")

#  But the assignment says "four png's and four R code files" so here we go:
rawdata <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c('?'))
data <- rawdata[ grep("^[1|2]/2/2007", rawdata$Date), ]
# create a new column, "datetime"
data$datetime <- strptime( paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")


png("plot1.png")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
