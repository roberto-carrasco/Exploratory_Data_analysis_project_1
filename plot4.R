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


# prepare layout with 2 rows and 2 columns
par(mfrow=c(2,2))

# functions for 4 plots 

#plot for global active power Vs Date & Time
plot(my_powerData$DateTime, my_powerData$Global_active_power,
       type="l",  xlab="",ylab="Global Active Power")  

#plot for Voltage Vs Date & Time
plot(my_powerData$DateTime,my_powerData$Voltage,
       type="l",xlab="datetime",ylab="Voltage")

#plot for Energy sub metering Vs Date & Time
plot(my_powerData$DateTime, my_powerData$Sub_metering_1, type="n", xlab="",
     ylab="Energy sub metering")

#add lines for metering 1
with(my_powerData, lines(DateTime, Sub_metering_1))

#add lines for metering 2
with(my_powerData, lines(DateTime, Sub_metering_2, col="red"))

#add lines for metering 3
with(my_powerData, lines(DateTime, Sub_metering_3, col="blue"))

#add legend
legend("topright", lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)


#plot for Global reactive power Vs Date and Time
plot(my_powerData$DateTime,my_powerData$Global_reactive_power,
      type="l",xlab="datetime",ylab="Global_reactive_power")

#copy file plot4.png
dev.copy(png, file="plot4.png", height = 480, width = 480)
dev.off()