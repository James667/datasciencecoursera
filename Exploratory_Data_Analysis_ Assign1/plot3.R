##Read data from file
data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)
##Change date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
##Subset data for required dates
subset_data <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
##Change time format
subset_data$Time <- strptime(paste(subset_data$Date, subset_data$Time, sep = " "), "%Y-%m-%d %H:%M:%S")
##Create empty plot
png("plot3.png", width = 480, height = 480)
##Create graph in plot
plot(subset_data$Time, subset_data$Sub_metering_1, type="l", xlab = "", ylab = "Energy Sub metering")
##Add subMetering 2 and 3
lines(subset_data$Time, subset_data$Sub_metering_2, type="l", col = "red")
lines(subset_data$Time, subset_data$Sub_metering_3, type="l", col = "blue")
##Add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 3, col = c("black", "red", "blue"))
##Close graphics device
dev.off()