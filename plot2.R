setwd("C:/kaggle/exploratory data analysis")

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
household_power_consumption <- read.csv(unz(temp, "household_power_consumption.txt"), sep=";")
unlink(temp)

data<-subset(household_power_consumption,Date=="1/2/2007" | Date=="2/2/2007")


data$Global_active_power<-as.double(data$Global_active_power)
data$Sub_metering_1<-as.double(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.double(as.character(data$Sub_metering_2))
data$Sub_metering_3<-as.double(as.character(data$Sub_metering_3))
data$Voltage<-as.double(as.character(data$Voltage))
data$Global_reactive_power<-as.double(as.character(data$Global_reactive_power))


png(filename="plot2.png")
plot(data$Global_active_power/500,type="l",ylab="Global Active Power (kilowatts)", xlab="",xaxt="n")
axis(1, at=c(1,nrow(data)/2,nrow(data)),labels=c("Thu","Fri","Sat"))
dev.off()

