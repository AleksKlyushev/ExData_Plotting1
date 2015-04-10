setwd("C:/Users/123/Documents/R/coursera/Exploratory Data Analysis/Course Project/1")
data<-read.table("household_power_consumption.txt",colClasses = c("character"),
                 header = T,dec = ".",sep = ";")
data<-data[data$Date == "1/2/2007"|data$Date == "2/2/2007" ,]
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Time_1<-as.Date.character(paste(data$Date,data$Time,sep = ";"), "%d/%m/%Y;%H:%M:%S")

plot(data$Global_active_power,
     type = "S",
     main = "Global Activity Power",
     ylab = "Global Activity Power (kilowatts)",
     xlab = "",
     axes = FALSE)
axis(1,at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))
axis(2,at = c(0,2,4,6))
box()

dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off() 

