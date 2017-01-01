
# Read in the Dataset from local source
pdata = read.table("household_power_consumption.txt", sep = ";",
                   header = TRUE, stringsAsFactors = FALSE)

# Extract data from only the first 2 days in February 2007
p2days = subset(pdata, Date == "1/2/2007" | Date == "2/2/2007")

# Convert the data to a numeric class for hist
global_p = as.numeric(p2days$Global_active_power)

# Start the PNG graphics device and specify parameters
png("plot1.png", width = 480, height = 480)
hist(global_p, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Close the device
dev.off()

# Check image in local source