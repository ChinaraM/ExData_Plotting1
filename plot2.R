
data <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
Fulltime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, Fulltime)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- format(data$Time, format="%H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
subsetdata <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")
png("plot2.png", width=480, height=480)
with(subsetdata, plot(Fulltime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()

