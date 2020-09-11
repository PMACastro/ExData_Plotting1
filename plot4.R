# DATA EXTRACTION.
data <- read.table("household_power_consumption.txt", head=T, sep = ";", na.strings = "?")
data2007 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")                          # 2007 data selection.
data2007$DateTime <- paste(data2007$Date, data2007$Time)
data2007$DateTime <- strptime(data2007$DateTime, "%d/%m/%Y %H:%M:%S")                      # Turning into "Time" class.

#GRAPH CREATION.
par(mfcol=c(2,2))

# Plot 1
plot( data2007$DateTime, data2007$Global_active_power,
      type="l",
      ylab="Global Active (kilowatts)",
      xlab="")  

#Plot 2
plot(data2007$DateTime, data2007$Sub_metering_1,          
      type="l",
      col="black",
      xlab="",
      ylab="Energy sub metering")
  lines(data2007$DateTime, data2007$Sub_metering_2,
        col="red")
  lines(data2007$DateTime, data2007$Sub_metering_3,
        col="blue")
  legend ("topright",
          c("Sub metering 1", "Sub metering 2", "Sub metering 1"), 
          col=c("black", "red", "blue"), 
          lty = 1,
          cex=0.7)

#Plot 3
plot( data2007$DateTime, data2007$Voltage,
      type="l",
      ylab="Voltage",
      xlab="")

#Plot 4
plot( data2007$DateTime, data2007$Global_reactive_power,
      type="l",
      ylab="Global Reactive (kilowatts)",
      xlab="")

#GRAPH TO PNG.
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()