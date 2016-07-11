# Load the "household_power_consumption.txt" dataset and plot the
# global active power, the voltage, the sub energy metering and the 
# global reactive power, measured on 01/02/2007 and 02/02/2007,
# as a function of the date (day and time of day) in four subplots.
# This script should be run from the same directory as the dataset.

# Load the full dataset and retain only the data from 01/02/2007 and 02/02/2007
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                   na.strings=c("NA","?"), nrows = 69516, stringsAsFactors=FALSE)
data <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

# Convert the "Date" and "Time" columns into Date/Time objects, stored in a new column
data$DateTime <- with(data, strptime(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"))

# Initialize a png device, make the plots and close the device.
png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))

plot(data$DateTime, data$Global_active_power, type="n", xlab="", 
     ylab="Global Active Power")
lines(data$DateTime, data$Global_active_power)

plot(data$DateTime, data$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(data$DateTime, data$Voltage)

plot(c(data$DateTime,data$DateTime,data$DateTime), 
     c(data$Sub_metering_1,data$Sub_metering_2,data$Sub_metering_3), type="n", xlab="", 
     ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", names(data)[7:9], lty=1, col=c("black","red","blue"), bty="n")

plot(data$DateTime, data$Global_reactive_power, type="n", xlab="datetime", 
     ylab="Global_reactive_power")
lines(data$DateTime, data$Global_reactive_power)

dev.off()