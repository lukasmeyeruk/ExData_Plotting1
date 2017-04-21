data <- read.delim('./household_power_consumption.txt', header = TRUE, sep = ";", na.strings='?')
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")
data_sub <- data[data$Date >= as.Date('2007-02-01') & data$Date <= as.Date('2007-02-02'),]

png('plot1.png')
hist(data_sub$Global_active_power, col = "red", main="Global Active power", xlab="Global Active Power (kilowatts)")
dev.off()
