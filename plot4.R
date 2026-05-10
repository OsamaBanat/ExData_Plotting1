## Plot 4 code :-
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
png("plot4.png", width = 480, height = 480)

## draw plot 4
par (mar = c(4,4,2,2), mfrow= c(2,2))

## topright part
plot(selected_data$DateTime, selected_data$Global_active_power, 
     pch = ".", 
     ylab = "Global Active Power", 
     xlab = "", 
     xaxt = "n" 
)

lines(selected_data$DateTime, selected_data$Global_active_power)

axis(
   1,
   at = as.POSIXct(selected_data$DateTime[c(1,1400,2800)]),
   labels = c("Thu", "Fri", "Sat")
)


## topleft part
plot(selected_data$DateTime, selected_data$Voltage, 
     pch = ".", 
     ylab = "Global Active Power", 
     xlab = "datetime", 
     xaxt = "n")

lines(selected_data$DateTime, selected_data$Voltage)

axis(
   1,
   at = as.POSIXct(selected_data$DateTime[c(1,1400,2800)]),
   labels = c("Thu", "Fri", "Sat")
)


## bottomright part
plot(selected_data$DateTime, selected_data$Sub_metering_1, 
     type = "n", pch = ".", 
     ylab = "Energy sub metering", 
     xlab = "", 
     xaxt = "n")

axis(
   1,
   at = as.POSIXct(selected_data$DateTime[c(1,1400,2800)]),
   labels = c("Thu", "Fri", "Sat"))

lines(selected_data$DateTime, selected_data$Sub_metering_1)

lines(selected_data$DateTime, selected_data$Sub_metering_2, col = "red")

lines(selected_data$DateTime, selected_data$Sub_metering_3, col = "blue")

legend(
   "topright",
   legend = c("Sub_metering_1",
              "Sub_metering_2",
              "Sub_metering_3"),
   col = c("black", "red", "blue"),
   lty = 1, bty = "n")

## bottomleft part 
plot(selected_data$DateTime, selected_data$Global_reactive_power, 
     pch = ".", 
     ylab = "Global_reactive_power", 
     xlab = "datetime", 
     xaxt = "n")

lines(selected_data$DateTime, selected_data$Global_reactive_power)

axis(
   1,
   at = as.POSIXct(selected_data$DateTime[c(1,1400,2800)]),
   labels = c("Thu", "Fri", "Sat")
)


## Exit file
dev.off()

