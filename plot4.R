data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')) #get a data frame from the text file
library(dplyr) #we will use the dply package
bien <- filter(data, Date == "1/2/2007" | Date == "2/2/2007") #Filter dates
bien$Date <- as.Date(bien$Date, format = "%d/%m/%Y") #dates format
bien$unir <- paste(bien$Date, bien$Time) #merge the data
bien$Time <- as.POSIXct(bien$unir)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(bien, {
  plot(x = bien$Time, y = bien$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(x = bien$Time, y = bien$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(Global_active_power~Time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(x = bien$Time, y = bien$Sub_metering_2, type = "l", col = "red")
  lines(x = bien$Time, y = bien$Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(x = bien$Time, y = bien$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
