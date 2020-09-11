# DATA EXTRACTION.
data <- read.table("household_power_consumption.txt", head=T, sep = ";", na.strings = "?")
data2007 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")                          # 2007 data selection.
data2007$DateTime <- paste(data2007$Date, data2007$Time)
data2007$DateTime <- strptime(data2007$DateTime, "%d/%m/%Y %H:%M:%S")                      # Turning into "Time" class.

#GRAPH CREATION.
hist(data2007$Global_active_power,
     main="Global Active Power",
     col="red",
     xlab="Global Active Power (kilowatts)")

#GRAPH TO PNG.
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()