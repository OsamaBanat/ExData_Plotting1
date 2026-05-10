## Plot 3 code :-
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

## draw plot3
par (mar = c(4,4,2,2))
plot(selected_data$DateTime, selected_data$Sub_metering_1, 
     type = "n", pch = ".", 
     ylab = "Energy sub metering", 
     xlab = "", 
     xaxt = "n" 
     )

text(x = selected_data$DateTime[c(1, 1400, 2800)], 
     y= - 3.5, 
     labels = c("Thu", "Fri", "Sat"), 
     xpd = TRUE
     )
lines(selected_data$DateTime, selected_data$Sub_metering_1)

lines(selected_data$DateTime, selected_data$Sub_metering_2, col = "red")

lines(selected_data$DateTime, selected_data$Sub_metering_3, col = "blue")

legend(
   "topright",
   legend = c("Sub_metering_1",
              "Sub_metering_2",
              "Sub_metering_3"),
   col = c("black", "red", "blue"),
   lty = 1
)

## Exit file
dev.off()