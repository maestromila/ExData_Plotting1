data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

globalactivepower <- as.numeric(subdata$Global_active_power)
Sub_metering_1 <- as.numeric(subdata$Sub_metering_1)
Sub_metering_2 <- as.numeric(subdata$Sub_metering_2)
Sub_metering_3 <- as.numeric(subdata$Sub_metering_3)
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480)
plot(datetime, Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering")
lines(datetime,Sub_metering_2, col="red")
lines(datetime,Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1), 
       lwd=c(2.5,2.5),col=c("black", "red","blue"))# gives the legend lines the correct color and width
dev.off()