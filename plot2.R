source("getdata.R")

filtered <- getDataFromFile()

png(file = "plot2.png", bg = "transparent")
plot(filtered$DateTime, filtered$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()