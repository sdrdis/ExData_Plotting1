source("getdata.R")

filtered <- getDataFromFile()

png(file = "plot4.png", bg = "transparent")
par(mfcol=c(2,2))

# TOP LEFT
plot(filtered$DateTime, filtered$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# BOTTOM LEFT
plot(filtered$DateTime, filtered$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(filtered$DateTime, filtered$Sub_metering_2, col="red")
lines(filtered$DateTime, filtered$Sub_metering_3, col="blue")
legend("topright", col = c("black", "red", "blue"), lwd=c(2.5, 2.5), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# TOP RIGHT
plot(filtered$DateTime, filtered$Voltage, type="l", xlab="datetime", ylab="Voltage")

# BOTTOM RIGHT
plot(filtered$DateTime, filtered$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

