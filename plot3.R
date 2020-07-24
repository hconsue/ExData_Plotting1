## Program: plot3.R

## Read input file
DataFileName <- "household_power_consumption.txt"
DataFile <- read.table(DataFileName, header = TRUE, sep = ";")

## Select information for dates of interest
DataFile <- DataFile[DataFile$Date == "1/2/2007" | DataFile$Date == "2/2/2007",]

## Convert columns required for the plot
DataFile$Date <- strptime(paste(DataFile$Date, DataFile$Time, sep = " "),
                          format = '%d/%m/%Y %H:%M:%S')
DataFile$Sub_metering_1 <- as.numeric(DataFile$Sub_metering_1)
DataFile$Sub_metering_2 <- as.numeric(DataFile$Sub_metering_2)

## Plot according with the specification given
png("plot3.png", width = 480, height = 480, units = "px")
plot(DataFile$Date, DataFile$Sub_metering_1, 
     type = "l",
     ylab = "Energy sub metering",
     xlab = "")
lines(DataFile$Date, DataFile$Sub_metering_2, col = "red")
lines(DataFile$Date, DataFile$Sub_metering_3, col = "blue")
legend("topright", pch = "_", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
