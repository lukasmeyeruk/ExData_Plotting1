data <- read.delim('./household_power_consumption.txt', header = TRUE, sep = ";", na.strings='?')
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")
data_sub <- data[data$Date >= as.Date('2007-02-01') & data$Date <= as.Date('2007-02-02'),]

png('plot4.png')
par(mfrow=c(2,2))
par(mfcol=c(2,2))

plot(Global_active_power ~ DateTime, data_sub, type="o", pch=".:", xlab="", ylab="Global Active Power (kilowatts)")
data_sub$DateTime <- as.POSIXct(paste(data_sub$Date, data_sub$Time), format="%Y-%m-%d %H:%M:%S")
plot(Sub_metering_1 ~ DateTime, data_sub, type="o", pch=".:", xlab="", ylab="Energy sub metering")
lines(Sub_metering_2 ~DateTime, data_sub, type="o", pch=".:", col="red")
lines(Sub_metering_3 ~DateTime, data_sub, type="o", pch=".:", col="blue")
legend( x= "topright", y=0.92, legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), bty = "n", lty=1)

plot(Voltage ~ DateTime, data_sub, type="o", pch=".:", xlab="datetime", ylab="Voltage")

plot(Global_reactive_power ~ DateTime, data_sub, type="o", pch=".:", xlab="datetime", ylab="Global_reactive_power")

dev.off()
