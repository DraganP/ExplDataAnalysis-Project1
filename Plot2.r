setwd("C:/Users/v-drapop/Documents/Coursera/DataScience/ExploratoryDataAnalysis")
# Read the complete dataset
all_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", quote = "\"", na.strings = "?", nrows = 2075259, check.names = FALSE, comment.char = "", stringsAsFactors = FALSE)
all_data$Date <- as.Date(all_data$Date, format = "%d/%m/%Y")

# Subset the desired dates from the complete dataset
d_data <- subset(all_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Remove the complete dataset to free up memory
rm(all_data)

# Convert the Date and Time variables to Date/Time classes
Date_Time <- paste(as.Date(d_data$Date), d_data$Time)
d_data$DateTime <- as.POSIXct(Date_Time)

# Create Plot 2
plot(d_data$Global_active_power~d_data$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Save Plot 2 to file
dev.copy(png, file="Plot2.png", height=480, width=480)
dev.off()