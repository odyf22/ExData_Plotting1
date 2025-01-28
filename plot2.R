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




# Plot 2: Global Active Power Over Time
png("plot2.png", width = 480, height = 480)
plot(subset_data$Datetime, subset_data$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)", 
     main = "Global Active Power Over Time")
dev.off()

