data <- read.delim('./household_power_consumption.txt', header = TRUE, sep = ";", na.strings='?')
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")
data_sub <- data[data$Date >= as.Date('2007-02-01') & data$Date <= as.Date('2007-02-02'),]

png('plot2.png')
data_sub$DateTime <- as.POSIXct(paste(data_sub$Date, data_sub$Time), format="%Y-%m-%d %H:%M:%S")
plot(Global_active_power ~ DateTime, data_sub, type="o", pch=".:", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()