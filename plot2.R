#Read Data
hoc <- read.table(file = './data/household_power_consumption.txt',sep = ';', skip = 66637,nrows = 2880,header = FALSE, na.strings = "?")
#hoc <- read.table(file = './data/household_power_consumption.txt',sep = ';',header = FALSE, na.strings = "?")
header <- read.table(file = './data/household_power_consumption.txt',sep = ';', header = FALSE,nrows = 1, stringsAsFactors = FALSE)
colnames(hoc) <- unlist(header)
hoc$DateTime <- strptime(paste(hoc$Date, hoc$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

#Generate Plot
plot(x = hoc$DateTime, y = hoc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Save File
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
