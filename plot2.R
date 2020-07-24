## Program: plot2.R

## Read input file
DataFileName <- "household_power_consumption.txt"
DataFile <- read.table(DataFileName, header = TRUE, sep = ";")

## Select information for dates of interest
DataFile <- DataFile[DataFile$Date == "1/2/2007" | DataFile$Date == "2/2/2007",]

## Convert columns required for the plot
DataFile$Date <- strptime(paste(DataFile$Date, DataFile$Time, sep = " "),
                          format = '%d/%m/%Y %H:%M:%S')
DataFile$Global_active_power <- as.numeric(DataFile$Global_active_power)

## Plot according with the specification given
png("plot2.png", width = 480, height = 480, units = "px")
plot(DataFile$Date, DataFile$Global_active_power,
     type = "l",
     ylab = "Global active power (kilowatts)",
     xlab = "")
dev.off()
