data<-read.table(".//Power Data//household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
data<-transform(data, Date=as.Date(Date, format = "%d/%m/%Y"), Time = as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S"))
subdata<-data[data$Date == as.Date("2007/02/01") | data$Date == as.Date("2007/02/02"),]

png(filename="plot2.png", width=480, height=480)

plot(subdata$Global_active_power ~ subdata$Time,type = "l", ylab = "Global Active Power (kilowatts)",xlab="")

dev.off()


