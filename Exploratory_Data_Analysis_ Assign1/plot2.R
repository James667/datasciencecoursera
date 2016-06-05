##Read data from file
data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)
##Change date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
##Subset data for required dates
subset_data <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
##Change time format
subset_data$Time <- strptime(paste(subset_data$Date, subset_data$Time, sep = " "), "%Y-%m-%d %H:%M:%S")
##Create empty plot
png("plot2.png", width = 480, height = 480)
##Create graph  in plot
plot(subset_data$Time, subset_data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
##Close graphics device
dev.off()