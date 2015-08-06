data<-read.table(".//Power Data//household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
data<-transform(data, Date=as.Date(Date, format = "%d/%m/%Y"), Time = as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S"))
subdata<-data[data$Date == as.Date("2007/02/01") | data$Date == as.Date("2007/02/02"),]

png(filename="plot4.png", width=480, height=480)

par(mfrow = c(2,2))

plot(subdata$Global_active_power ~ subdata$Time,type = "l", ylab = "Global Active Power",xlab="")

plot(subdata$Voltage ~ subdata$Time,type = "l", ylab = "Voltage",xlab="datetime")

plot(subdata$Sub_metering_1 ~ subdata$Time,type = "n", ylab = "Energy Sub Metering",xlab="")
points(subdata$Sub_metering_3 ~ subdata$Time, col="blue", type = "l")
points(subdata$Sub_metering_2 ~ subdata$Time, col="red", type = "l")
points(subdata$Sub_metering_1 ~ subdata$Time, col="black", type = "l")
legend("topright",lty=c(1,1,1) ,col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

plot(subdata$Global_reactive_power ~ subdata$Time,type = "l", ylab = "Global_reactive_power",xlab="datetime")

dev.off()
