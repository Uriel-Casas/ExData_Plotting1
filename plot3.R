data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')) #get a data frame from the text file
library(dplyr) #we will use the dply package
bien <- filter(data, Date == "1/2/2007" | Date == "2/2/2007") #Filter dates
bien$Date <- as.Date(bien$Date, format = "%d/%m/%Y") #dates format
bien$unir <- paste(bien$Date, bien$Time) #merge the data
bien$Time <- as.POSIXct(bien$unir)

plot(x = bien$Time, y = bien$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x = bien$Time, y = bien$Sub_metering_2, type = "l", col = "red")
lines(x = bien$Time, y = bien$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
