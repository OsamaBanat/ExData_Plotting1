## Plot 2 code :-
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
png("plot2.png", width = 480, height = 480)


## draw a histogram
par (mar = c(4,4,2,2))
plot (selected_data$DateTime, selected_data$Global_active_power, pch = ".", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = "n" )
lines(selected_data$DateTime, selected_data$Global_active_power)
text(x = selected_data$DateTime[c(1, 1400, 2800)], y= - 0.4,
, labels = c("Thu", "Fri", "Sat"), xpd = TRUE)

## close the file
dev.off()

