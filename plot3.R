rm(list = ls())

# Read in the Dataset from local source
pdata = read.table("household_power_consumption.txt", sep = ";",
                   header = TRUE, stringsAsFactors = FALSE)

# Extract data from only the first 2 days in February 2007
p2days = subset(pdata, Date == "1/2/2007" | Date == "2/2/2007")

# Convert the Date column to a recongnized date class to get day of week
x = paste(p2days$Date, p2days$Time, sep = " ")
dayofweek = strptime(x, "%d/%m/%Y %H:%M:%S")

# Initiate the PNG graphics device and specify paramters
png("plot3.png", width = 480, height = 480)
plot(dayofweek, as.numeric(p2days$Sub_metering_1), type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(dayofweek, as.numeric(p2days$Sub_metering_2), type = "l", col = "red")
lines(dayofweek, as.numeric(p2days$Sub_metering_3), type = "l", col = "blue")
legend("topright", c("Sub metering 1", "Sub metering 2", "Sub metering 3"),
       lty = 1, lwd = 2, col = c("black", "red", "blue"))
dev.off()