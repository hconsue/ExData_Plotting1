## Program: plot1.R

## Read input file
DataFileName <- "household_power_consumption.txt"
DataFile <- read.table(DataFileName, header = TRUE, sep = ";")

## Select information for dates of interest
DataFile <- DataFile[DataFile$Date == "1/2/2007" | DataFile$Date == "2/2/2007",]

## Convert columns required for the plot
DataFile$Global_active_power <- as.numeric(DataFile$Global_active_power)

## Plot according with the specification given
png("plot1.png", width = 480, height = 480, units = "px")
hist(DataFile$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()
