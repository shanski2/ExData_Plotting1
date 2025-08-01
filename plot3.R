#Exploratory Data Analysis Course Project 1 - PLOT 3
#Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. 

#Step 1: Read Table
data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE, dec=".")

#Step 2: Subset data - only interested in 1/2/07 to 2/2/07
datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
datasubset$Date <- as.Date(datasubset$Date, format = "%d/%m/%Y")

#Step 3: Prepare data
#create datetime variable
datasubset$DateTime <- as.POSIXct(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
class(datasubset$DateTime)
length(datasubset$DateTime)

datasubset$globalActivePower <- as.numeric(datasubset$Global_active_power)
class(datasubset$globalActivePower)
length(datasubset$globalActivePower)


#Step 4: Plot 3 - construct and save to PNG file
png("plot3.png", width=480, height=480)
with(datasubset, {plot(Sub_metering_1~DateTime, type = "l", xlab = "", ylab="Energy sub metering")
     lines(Sub_metering_2~DateTime, col="red")
     lines(Sub_metering_3~DateTime, col="blue")})

legend("topright", col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty =1)

#custom x-axis
#axis.Date(1, at = datasubset$Datetime, format = "%a") 

dev.off()