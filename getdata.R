getDataFromFile <- function() {
        cacheFile <- "cache.RData"
        
        if (file.exists(cacheFile)) {
                load(file=cacheFile)
        } else {
                # Downloading the file
                print ("Data file not available. Downloading it...")
                url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
                tmp_file <- "./temp.zip"
                download.file(url,tmp_file, method="curl")
                unzip(tmp_file, exdir="./")
                unlink(tmp_file)
                
                # Reading and caching the filtered dataset
                print ("Data file successfully downloaded. Reading it and caching the filtered dataset...")
                raw = read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
                filtered = raw[raw$Date == "1/2/2007" | raw$Date == "2/2/2007",]
                filtered$DateTime = strptime(paste(filtered$Date, filtered$Time, sep=" "), format="%e/%m/%Y %H:%M:%S")
                save(filtered, file=cacheFile)
        }
        filtered
}