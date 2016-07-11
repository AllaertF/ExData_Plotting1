# Load the "household_power_consumption.txt" dataset and make a 
# histogram of the global active power, measured on 01/02/2007 
# and 02/02/2007.
# This script should be run from the same directory as the dataset.

# Load the full dataset and retain only the data from 01/02/2007 and 02/02/2007
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                   na.strings=c("NA","?"), nrows = 69516, stringsAsFactors=FALSE)
data <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

# Convert the "Date" and "Time" columns into Date/Time objects, stored in a new column
data$DateTime <- with(data, strptime(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"))

# Initialize a png device, make the plot and close the device.
png("plot1.png", width=480, height=480, units="px")
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()