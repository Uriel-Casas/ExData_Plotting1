data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')) #get a data frame from the text file
library(dplyr) #we will use the dply package
bien <- filter(data, Date == "1/2/2007" | Date == "2/2/2007") #Filter dates
bien$Date <- as.Date(bien$Date, format = "%d/%m/%Y") #dates format
bien$unir <- paste(bien$Date, bien$Time) #merge the data
bien$Time <- strptime(bien$unir, format = "%Y-%m-%d %H:%M:%S")

hist(bien$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red") #Create the graph
dev.copy(png,"plot1.png", width=480, height=480) #save histogram
dev.off()
