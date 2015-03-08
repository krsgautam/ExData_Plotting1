## Exloratory Data Analyis
## Computer Porject 1
## Plot 1
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


## Making Plot 1

hist(DF$Global_active_power, main = "Global Active Power", 
     col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()


