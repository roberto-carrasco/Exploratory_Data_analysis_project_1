#reading dataset
my_data <- read.table("household_power_consumption.txt", header = T, 
                      sep = ";", na.strings = "?")

#format vaiable "Date" to type date 
my_data$Date <- as.Date(my_data$Date, format = "%d/%m/%Y")

#subsetting by dates
my_powerData <- subset(my_data, my_data$Date >= "2007-02-01" & 
                         my_data$Date <= "2007-02-02")

my_powerData$DateTime <- strptime(paste(my_powerData$Date, 
                                        my_powerData$Time), "%Y-%m-%d %H:%M:%S")



#plot 1, basic plot (histogram) function
hist(my_powerData$Global_active_power, col="red", 
     main="Global Active Power",xlab="Global Active Power(kilowatts)")

#copy to png file plot1.png
dev.copy(png, file="plot1.png", height = 480, width = 480)
dev.off()
