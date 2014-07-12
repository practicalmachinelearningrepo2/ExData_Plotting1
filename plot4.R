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



png(filename="plot4.png")
par(mfrow=c(2,2)) 
plot(data$Global_active_power/500,type="l",ylab="Global Active Power", xlab="",xaxt="n")
axis(1, at=c(1,nrow(data)/2,nrow(data)),labels=c("Thu","Fri","Sat"))

plot(data$Voltage,type="l",ylab="Voltage", xlab="datetime",xaxt="n")
axis(1, at=c(1,nrow(data)/2,nrow(data)),labels=c("Thu","Fri","Sat"))

plot (data$Sub_metering_1,type = "l", axes=FALSE,xlab="", ylab = "Energy sub metering", col = "black")
lines (data$Sub_metering_2[as.numeric(data$Sub_metering_2)<10],type = "l", col = "red")
lines (data$Sub_metering_3,type = "l", col = "blue")
axis(1, at=c(1,nrow(data)/2,nrow(data)),labels=c("Thu","Fri","Sat"))
axis(2, at=c(1,10,20,30),labels=c("0","10","20","30"))
legend("topright",bty="n", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

plot(data$Global_reactive_power,type="l",ylab="Global_reactive_power", xlab="datetime",xaxt="n")
axis(1, at=c(1,nrow(data)/2,nrow(data)),labels=c("Thu","Fri","Sat"))
dev.off()
