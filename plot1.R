#Download File
if(!file.exists('./data')){dir.create('./data')}
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile = './data/power_consumption.zip')
unzip(zipfile = './data/power_consumption.zip',exdir = './data')

#Read Data
hoc <- read.table(file = './data/household_power_consumption.txt',sep = ';', skip = 66637,nrows = 2880,header = FALSE, na.strings = "?")
#hoc <- read.table(file = './data/household_power_consumption.txt',sep = ';',header = FALSE, na.strings = "?")
header <- read.table(file = './data/household_power_consumption.txt',sep = ';', header = FALSE,nrows = 1, stringsAsFactors = FALSE)
colnames(hoc) <- unlist(header)
hoc$DateTime <- strptime(paste(hoc$Date, hoc$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

#Generate Plot
with(hoc, hist(Global_reactive_power, xlab = 'Global Active Power(kilowatts)',main = 'Global Active Power',col = 'red'))

#Save File
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
