# This would be the smart way to do this:
# source("load_data.R")

#  But the assignment says "four png's and four R code files" so here we go:
rawdata <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c('?'))
data <- rawdata[ grep("^[1|2]/2/2007", rawdata$Date), ]
# create a new column, "datetime"
data$datetime <- strptime( paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")


# create a file
png("plot2.png")

# plot it
plot(data$datetime, data$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")

# save the file
dev.off()
