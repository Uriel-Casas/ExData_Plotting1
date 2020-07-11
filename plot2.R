data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')) #get a data frame from the text file
library(dplyr) #we will use the dply package
bien <- filter(data, Date == "1/2/2007" | Date == "2/2/2007") #Filter dates
bien$Date <- as.Date(bien$Date, format = "%d/%m/%Y") #dates format
bien$unir <- paste(bien$Date, bien$Time) #merge the data
bien$Time <- as.POSIXct(bien$unir)

plot(bien$Global_active_power~bien$Time, type="l", ylab="Global Active Power (kilowatts)", xlab="")

