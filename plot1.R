#Exploratory Data Analysis Course Project 1 - PLOT 1
#Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. 

#Step 1: Read Table
data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE, dec=".")

#Step 2: Subset data - only interested in 1/2/07 to 2/2/07
datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
class(datasubset)

#Step 3: Plot 1 - construct and save to PNG file
globalActivePower <- as.numeric(datasubset$Global_active_power)

png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.print(png, "plot1.png", width = 480, height = 480)

dev.off()