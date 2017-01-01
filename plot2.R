rm(list = ls())

# Read in the Dataset from local source
pdata = read.table("household_power_consumption.txt", sep = ";",
                   header = TRUE, stringsAsFactors = FALSE)

# Extract data from only the first 2 days in February 2007
p2days = subset(pdata, Date == "1/2/2007" | Date == "2/2/2007")

# Convert the Date column to a recongnized date class to get day of week
x = paste(p2days$Date, p2days$Time, sep = " ")
dayofweek = strptime(x, "%d/%m/%Y %H:%M:%S")

# Convert the data to a numeric class for plot function
global_p = as.numeric(p2days$Global_active_power)

# Start the PNG graphics device and specify parameters
png("plot2.png", width=480, height=480)
plot(dayofweek, global_p, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Close the graphics device
dev.off()