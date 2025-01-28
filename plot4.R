
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




# Load data (assuming it's already filtered and preprocessed as 'subset_data')
# subset_data is a dataframe containing columns 'Datetime', 'Global_active_power',
# 'Voltage', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3', and 'Global_reactive_power'.

# Set up a 2x2 plotting area
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))  # Create a 2x2 grid of plots

# Plot 1: Global Active Power
plot(subset_data$Datetime, subset_data$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power", main = "")

# Plot 2: Voltage
plot(subset_data$Datetime, subset_data$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage", main = "")

# Plot 3: Energy Sub Metering
plot(subset_data$Datetime, subset_data$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(subset_data$Datetime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$Datetime, subset_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, bty = "n")

# Plot 4: Global Reactive Power
plot(subset_data$Datetime, subset_data$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global Reactive Power", main = "")

# Close the plotting device
dev.off()
