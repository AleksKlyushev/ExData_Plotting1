setwd("C:/Users/123/Documents/R/coursera/Exploratory Data Analysis/Course Project/1")
data<-read.table("household_power_consumption.txt",colClasses = c("character"),
                 header = T,dec = ".",sep = ";")
data<-data[data$Date == "1/2/2007"|data$Date == "2/2/2007" ,]
data$Global_active_power<-as.numeric(data$Global_active_power)

hist(data$Global_active_power,
     col = "red",
     main = "Global Activity Power",     
     xlim = c(0,6),
     xlab = "Global Activity Power (kilowatts)",
     axes = FALSE)
axis(1,at = c(0,2,4,6))
axis(2)

dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() 

