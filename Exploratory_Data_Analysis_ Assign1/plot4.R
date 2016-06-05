##Read data from file
data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)
##Change date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
##Subset data for required dates
subset_data <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
##Change time format
subset_data$Time <- strptime(paste(subset_data$Date, subset_data$Time, sep = " "), "%Y-%m-%d %H:%M:%S")
##Create empty plot
png("plot4.png", width = 480, height = 480)
##Setup 2*2 graph array
par(mfrow = c(2, 2))
##Plot 1 (1, 1)
plot(subset_data$Time, subset_data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
##Plot 2 (1, 2)
plot(subset_data$Time, subset_data$Voltage, type="l", xlab = "datetime", ylab = "Voltage")
##Plot 3 (2, 1)
plot(subset_data$Time, subset_data$Sub_metering_1, type="l", xlab = "", ylab = "Energy Sub metering")
lines(subset_data$Time, subset_data$Sub_metering_2, type="l", col = "red")
lines(subset_data$Time, subset_data$Sub_metering_3, type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, col = c("black", "red", "blue"), bty = "n", cex = 0.9 )
##Plot 4 (2, 2)
plot(subset_data$Time, subset_data$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")
##Close graphics device
dev.off()