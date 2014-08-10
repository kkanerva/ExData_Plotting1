# This would be the smart way to do this:
# source("load_data.R")

#  But the assignment says "four png's and four R code files" so here we go:
rawdata <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c('?'))
data <- rawdata[ grep("^[1|2]/2/2007", rawdata$Date), ]
# create a new column, "datetime"
data$datetime <- strptime( paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")


png("plot3.png")

plot(data$datetime, data$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend("topright", inset=0, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1), lwd=c(2.5, 2.5))

dev.off()
