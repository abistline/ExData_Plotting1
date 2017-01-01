rm(list = ls())

# Read in the Dataset from local source
pdata = read.table("household_power_consumption.txt", sep = ";",
                   header = TRUE, stringsAsFactors = FALSE)

# Extract data from only the first 2 days in February 2007
p2days = subset(pdata, Date == "1/2/2007" | Date == "2/2/2007")

# Convert the Date column to a recongnized date class to get date/time
x = paste(p2days$Date, p2days$Time, sep = " ")
datetime = strptime(x, "%d/%m/%Y %H:%M:%S")

global_ap = as.numeric(p2days$Global_active_power)
global_rp = as.numeric(p2days$Global_reactive_power)
voltage = as.numeric(p2days$Voltage)

#Initiate the PNG graphics device and specify parameters
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

plot(datetime, global_ap, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

plot(datetime, voltage, type = "l", xlab="datetime", ylab = "Voltage")

plot(datetime, as.numeric(p2days$Sub_metering_1), type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(datetime, as.numeric(p2days$Sub_metering_2), type = "l", col = "red")
lines(datetime, as.numeric(p2days$Sub_metering_3), type = "l", col = "blue")
legend("topright", c("Sub metering 1", "Sub metering 2", "Sub metering 3"),
       lty = 1, lwd = 2, col = c("black", "red", "blue"), bty = "n")

plot(datetime, global_rp, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
