require("data.table")
d <- fread("household_power_consumption.txt", skip = "1/2/2007", nrows = 2881, na.strings = "?", 
           col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
                         "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
d[, parsed_date:=as.POSIXct(paste(Date, Time), "%d/%m/%Y %H:%M:%S", tz = "UTC")]
png(filename = "plot3.png", width = 480, height = 480, units = "px")

plot(d$parsed_date, d$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
lines(d$parsed_date, d$Sub_metering_2, col = "red")
lines(d$parsed_date, d$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1,1,1))

dev.off()

