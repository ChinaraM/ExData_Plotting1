
data <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
Fulltime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, Fulltime)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- format(data$Time, format="%H:%M:%S")
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
subsetdata <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")
png("plot3.png", width=480, height=480)
with(subsetdata, plot(Fulltime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(subsetdata$Fulltime, subsetdata$Sub_metering_2,type="l", col= "red")
lines(subsetdata$Fulltime, subsetdata$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
dev.off()
