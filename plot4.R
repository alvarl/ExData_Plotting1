require("data.table")
d <- fread("household_power_consumption.txt", skip = "1/2/2007", nrows = 2881, na.strings = "?", 
           col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
                         "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
d[, parsed_date:=as.POSIXct(paste(Date, Time), "%d/%m/%Y %H:%M:%S", tz = "UTC")]

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol=c(2,2))

with(d, {
  # Top left plot
  plot(parsed_date, Global_active_power, main = "Global active power", ylab = "Global active power (kilowatts)", xlab = "", type = "l")
  
  # Bottom left plot
  plot(parsed_date, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
  lines(parsed_date, Sub_metering_2, col = "red")
  lines(d$parsed_date, Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col = c("black", "red", "blue"), lty = c(1,1,1), box.lwd = 0)
  
  # Top right plot
  plot(parsed_date, Voltage, ylab = "Voltage", xlab = "datetime", type = "l")
  
  # Bottom right plot
  plot(parsed_date, Global_reactive_power, xlab = "datetime", type = "l")
})

dev.off()

