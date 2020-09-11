# DATA EXTRACTION.
data <- read.table("household_power_consumption.txt", head=T, sep = ";", na.strings = "?")
data2007 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")                          # 2007 data selection.
data2007$DateTime <- paste(data2007$Date, data2007$Time)
data2007$DateTime <- strptime(data2007$DateTime, "%d/%m/%Y %H:%M:%S")                      # Turning into "Time" class.

#GRAPH CREATION.
plot(data2007$DateTime, data2007$Sub_metering_1,
     type="l",
     col="black",
     xlab="",
     ylab="Energy sub metering")
lines(data2007$DateTime, data2007$Sub_metering_2,
      col="red")
lines(data2007$DateTime, data2007$Sub_metering_3,
      col="blue")
legend ("topright", c("Sub metering 1", "Sub metering 2", "Sub metering 1"), col=c("black", "red", "blue"), lty = 1)

#GRAPH TO PNG.
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()

