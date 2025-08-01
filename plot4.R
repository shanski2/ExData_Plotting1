#Exploratory Data Analysis Course Project 1 - PLOT 4
#Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. 

#Step 1: Read Table
data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE, dec=".")

#Step 2: Subset data - only interested in 1/2/07 to 2/2/07
datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
datasubset$Date <- as.Date(datasubset$Date, format = "%d/%m/%Y")

#Step 3: Prepare data
#create datetime variable
datasubset$DateTime <- as.POSIXct(paste(datasubset$Date, datasubset$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
class(datasubset$DateTime)
length(datasubset$DateTime)

datasubset$globalActivePower <- as.numeric(datasubset$Global_active_power)
class(datasubset$globalActivePower)
length(datasubset$globalActivePower)

datasubset$globalReactivePower <- as.numeric(datasubset$Global_reactive_power)
datasubset$Voltage <- as.numeric(datasubset$Voltage)


#Step 4: Plot 4 - construct and save to PNG file
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#plot4a
plot(datasubset$DateTime, datasubset$globalActivePower, type = "l", xlab = "", ylab="Global Active Power (kilowatts)", xaxt = "n")
axis(1, 
     at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")),
     labels = c("Thu", "Fri", "Sat"))

#plot4b
plot(datasubset$DateTime, datasubset$Voltage, type = "l", xlab = "datetime", ylab="Voltage", xaxt = "n")
axis(1, 
     at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")),
     labels = c("Thu", "Fri", "Sat"))

#plot4c
with(datasubset, {plot(Sub_metering_1~DateTime, type = "l", xlab = "", ylab="Energy sub metering", xaxt = "n")
  lines(Sub_metering_2~DateTime, col="red")
  lines(Sub_metering_3~DateTime, col="blue")})
axis(1, 
     at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")),
     labels = c("Thu", "Fri", "Sat"))

legend("topright", col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty =1)

#plot4d
plot(datasubset$DateTime, datasubset$globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power", xaxt = "n")
#custom x-axis
axis(1, 
     at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")),
     labels = c("Thu", "Fri", "Sat"))


dev.off()