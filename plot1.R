require("data.table")
d <- fread("household_power_consumption.txt", skip = "1/2/2007", nrows = 2880, na.strings = "?", 
           col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
                         "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(d$Global_active_power, main = "Global active power", xlab = "Global active power (kilowatts)", col = "red")
dev.off()

