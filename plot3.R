## Exloratory Data Analyis
## Computer Porject 1
## Plot 3

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
DF <- transform(DF, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
DF$Sub_metering_1 <- as.numeric(as.character(DF$Sub_metering_1))
DF$Sub_metering_2 <- as.numeric(as.character(DF$Sub_metering_2))
DF$Sub_metering_3 <- as.numeric(as.character(DF$Sub_metering_3))

## Making Plot 3

plot(DF$timestamp,DF$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(DF$timestamp,DF$Sub_metering_2,col="red")
lines(DF$timestamp,DF$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), 
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()

