## Exloratory Data Analyis
## Computer Porject 1
## Plot 4

## Reading the Data

url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file_0 <- tempfile()
download.file(url, file_0)
file_1 <- unzip(file_0)
unlink(file_0)
data <- read.table(file_1, header=T, sep=";")

## Preparing the Data

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
DF <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
DF$Global_active_power <- as.numeric(as.character(DF$Global_active_power))
DF$Global_reactive_power <- as.numeric(as.character(DF$Global_reactive_power))
DF$Voltage <- as.numeric(as.character(DF$Voltage))
DF <- transform(DF, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
DF$Sub_metering_1 <- as.numeric(as.character(DF$Sub_metering_1))
DF$Sub_metering_2 <- as.numeric(as.character(DF$Sub_metering_2))
DF$Sub_metering_3 <- as.numeric(as.character(DF$Sub_metering_3))

## Making Plot 4

par(mfrow=c(2,2))

plot(DF$timestamp,DF$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(DF$timestamp,DF$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(DF$timestamp,DF$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(DF$timestamp,DF$Sub_metering_2,col="red")
lines(DF$timestamp,DF$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), 
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) 

plot(DF$timestamp,DF$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()

