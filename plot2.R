#reading dataset
my_data <- read.table("household_power_consumption.txt", header = T, 
                      sep = ";", na.strings = "?")

#format vaiable "Date" to type date 
my_data$Date <- as.Date(my_data$Date, format = "%d/%m/%Y")

#subsetting by dates
my_powerData <- subset(my_data, my_data$Date >= "2007-02-01" & 
                         my_data$Date <= "2007-02-02")

#generate new variable "DateTime"
my_powerData$DateTime <- strptime(paste(my_powerData$Date, 
                                        my_powerData$Time), "%Y-%m-%d %H:%M:%S")
#format date_time to POSIXct
my_powerData$DateTime <- as.POSIXct(my_powerData$DateTime)

#plot 2, global active power vs date_time
with(my_powerData,plot(my_powerData$DateTime,my_powerData$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab=""))

#Copy png file (plot2.png)
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()


