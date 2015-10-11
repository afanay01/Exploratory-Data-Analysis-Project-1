# Plot 4

# read data
db <-read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

db1 <- db[db$Date %in% c("1/2/2007", "2/2/2007"), ]

db1$Date <- as.Date(db1$Date, format = "%d/%m/%Y")
db1$Time <- strptime(paste(db1$Date, db1$Time), format = "%Y-%m-%d %H:%M:%S")

# generate plot

png(file="plot4.png",width=480,height=480)

   par (mfrow = c(2,2))

   #1st
  plot(db1$Time, db1$Global_active_power, ylab = "Global Active Power", xlab = " ", type = "l")

   #2nd
   plot(db1$Time, db1$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")

   #3rd
   plot(db1$Time,db1$Sub_metering_1, type = "l", xlab = "",ylab = "Energy sub metering") 
   lines (db1$Time,db1$Sub_metering_2, xlab = "",ylab = "", col = "red")
   lines (db1$Time,db1$Sub_metering_3, xlab = "",ylab = "", col = "blue")
   legend("topright", lty = 1, col = c("black", "red", "blue"), legend = names(db1)[7:9], bty = 'n')

   #4th
   plot(db1$Time, db1$Global_reactive_power, ylab = names(db1)[4], xlab = "datetime", type = "l")

dev.off()

