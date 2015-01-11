setwd("C:/Users/.../Documents/Coursera/DataScience/ExploratoryDataAnalysis")
# Read the complete dataset
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the desired dates from the complete dataset
d_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Remove the complete dataset to free up memory
rm(data)

# Convert the Date and Time variables to Date/Time classes
datetime <- strptime(paste(d_data$Date, d_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Create plot variables
subMtr1 <- as.numeric(d_data$Sub_metering_1)
subMtr2 <- as.numeric(d_data$Sub_metering_2)
subMtr3 <- as.numeric(d_data$Sub_metering_3)

# Create Plot 3
png("Plot3.png", width=480, height=480)
plot(datetime, subMtr1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMtr2, type="l", col="red")
lines(datetime, subMtr3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()