
# Set the file path
file_path <- "household_power_consumption.txt"

# Read the data for specific dates
data <- read.table(file_path, sep = ";", header = TRUE, na.strings = "?",
                   stringsAsFactors = FALSE)

# Convert Date to Date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Filter for the two dates
subset_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))




# Combine Date and Time into a POSIXct datetime
subset_data$Datetime <- as.POSIXct(paste(subset_data$Date, subset_data$Time), 
                                   format = "%Y-%m-%d %H:%M:%S")






# Plot 3: Energy Sub-Metering Over Time
png("plot3.png", width = 480, height = 480)
plot(subset_data$Datetime, subset_data$Sub_metering_1, type = "l", col = "black", 
     xlab = "", ylab = "Energy sub metering")
lines(subset_data$Datetime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$Datetime, subset_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)
dev.off()
