source("getdata.R")

filtered <- getDataFromFile()

png(file = "plot3.png", bg = "transparent")
plot(filtered$DateTime, filtered$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(filtered$DateTime, filtered$Sub_metering_2, col="red")
lines(filtered$DateTime, filtered$Sub_metering_3, col="blue")
legend("topright", col = c("black", "red", "blue"), lwd=c(2.5, 2.5), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()