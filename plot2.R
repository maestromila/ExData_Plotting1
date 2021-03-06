data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

globalactivepower <- as.numeric(subdata$Global_active_power)
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)
plot(datetime, globalactivepower, type = "l", xlab="", ylab = "Global Active Power (kilowatss)")
dev.off()
