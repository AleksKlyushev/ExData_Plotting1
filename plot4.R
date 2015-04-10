setwd("C:/Users/123/Documents/R/coursera/Exploratory Data Analysis/Course Project/1")
data<-read.table("household_power_consumption.txt",
                 colClasses = c("character"),
                 header = T,dec = ".",sep = ";")
data<-data[data$Date == "1/2/2007"|data$Date == "2/2/2007" ,]
data$Global_active_power<-as.numeric(data$Global_active_power)
data[data$Sub_metering_1=="?",7]<-NA
data[data$Sub_metering_3=="?",8]<-NA
data[data$Sub_metering_3=="?",9]<-NA

data[,7:9]<-as.numeric(unlist(data[,7:9]))
data$Time_1<-as.Date.character(paste(data$Date,data$Time,sep = ";"),
                               "%d/%m/%Y;%H:%M:%S")
par(mfrow = c(2, 2))
plot(data$Global_active_power,
     type = "S",
     ylab = "Global Activity Power (kilowatts)",
     xlab = "",
     axes = FALSE)
axis(1,at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))
axis(2,at = c(0,2,4,6))
box()

plot(data$Voltage,
     type = "S",
     ylab = "Voltage",
     xlab = "datetime",
     axes = FALSE)
axis(1,at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))
axis(2,at = c(234,238,242,246))
box()

plot(data$Sub_metering_1,
     type = "S",
     ylab = "Energy sub metering",
     xlab = "",
     axes = FALSE)
lines(data$Sub_metering_2,col = "red")
lines(data$Sub_metering_3,col = "blue")
axis(1,at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))
axis(2,at = c(0,10,20,30))
legend(x="topright",lty=1,bty = "n",  col = c("black","red", "blue")
       ,legend = colnames(data[,7:9]),cex = 0.7)
box()

plot(data$Global_reactive_power,
     type = "S",
     ylab = "Global_reactive_power",
     xlab = "datetime",
     axes = FALSE)
axis(1,at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))
axis(2,at = c(0.0,0.1,0.2,0.3,0.4,0.5))
box()


dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off() 

