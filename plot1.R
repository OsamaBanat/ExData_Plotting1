## Plot 1 code :-
## ================

##reading the data
data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

## subset based on date
selected_data <- data[data$Date == "2/2/2007" | data$Date == "1/2/2007",]

## convert the Date and Time variables 
selected_data$Date <- as.Date(selected_data$Date, format = "%d/%m/%Y")

selected_data$DateTime <- strptime(
   paste(selected_data$Date, selected_data$Time),
   format = "%Y-%m-%d %H:%M:%S"
)

## create a png file
png("plot1.png", width = 480, height = 480)

## draw a histogram
hist (selected_data$Global_active_power, col = "red", xlab = " Global Active Power (kilowatts)", main = "Global Active Power")

## close the file
dev.off()
