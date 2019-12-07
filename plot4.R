#Read Data
hoc <- read.table(file = './data/household_power_consumption.txt',sep = ';', skip = 66637,nrows = 2880,header = FALSE, na.strings = "?")
#hoc <- read.table(file = './data/household_power_consumption.txt',sep = ';',header = FALSE, na.strings = "?")
header <- read.table(file = './data/household_power_consumption.txt',sep = ';', header = FALSE,nrows = 1, stringsAsFactors = FALSE)
colnames(hoc) <- unlist(header)
hoc$DateTime <- strptime(paste(hoc$Date, hoc$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

#Generate Plot
par(mfrow = c(2,2))

#Plot 1
plot(x = hoc$DateTime
     , y = hoc$Global_active_power
     , type="l", xlab="", ylab="Global Active Power", cex.lab=0.8)
#Plot 2
plot(x = hoc$DateTime
     , y = hoc$Voltage
     , type="l", xlab="datetime", ylab="voltage")

#Plot 3
plot(x= hoc$DateTime, y = hoc$Sub_metering_1 , type = "l", col="black", xlab = "", ylab = "Energy sub metering")
lines(x= hoc$DateTime, y = hoc$Sub_metering_2 , type = "l", col="red")
lines(x= hoc$DateTime, y = hoc$Sub_metering_3 , type = "l", col="blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend=labels, col=c("black","red", "blue"), lty="solid", bty="n"
       , cex=.5)



#Plot 4
plot(hoc$DateTime,hoc$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime", cex.lab = .8)

## Save file and close device
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
