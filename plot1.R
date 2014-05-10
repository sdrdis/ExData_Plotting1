source("getdata.R")

filtered <- getDataFromFile()

png(file = "plot1.png", bg = "transparent")
hist(filtered$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()