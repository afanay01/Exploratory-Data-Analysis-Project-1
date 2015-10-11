# Plot 2

# read data
db <-read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

db1 <- db[db$Date %in% c("1/2/2007", "2/2/2007"), ]

db1$Date <- as.Date(db1$Date, format = "%d/%m/%Y")
db1$Time <- strptime(paste(db1$Date, db1$Time), format = "%Y-%m-%d %H:%M:%S")

# generate plot

png(file="plot2.png",width=480,height=480)

   plot(db1$Time, db1$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = " ", type = "l")

dev.off()

