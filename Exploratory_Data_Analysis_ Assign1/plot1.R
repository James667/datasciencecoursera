##Read data from file
data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)
##Change date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
##Subset data for required dates
subset_data <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
##Create empty plot
png("plot1.png", width = 480, height = 480)
##create histogram
hist(as.numeric(subset_data$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
##Close graphics device
dev.off()