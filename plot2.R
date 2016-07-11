# Load the "household_power_consumption.txt" dataset and plot the
# global active power, measured on 01/02/2007 and 02/02/2007,
# as a function of the date (day and time of day).
# This script should be run from the same directory as the dataset.

# Load the full dataset and retain only the data from 01/02/2007 and 02/02/2007
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                   na.strings=c("NA","?"), nrows = 69516, stringsAsFactors=FALSE)
data <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

# Convert the "Date" and "Time" columns into Date/Time objects, stored in a new column
data$DateTime <- with(data, strptime(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"))

# Initialize a png device, make the plot and close the device.
png("plot2.png", width=480, height=480, units="px")
plot(data$DateTime, data$Global_active_power, type="n", xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)
dev.off()