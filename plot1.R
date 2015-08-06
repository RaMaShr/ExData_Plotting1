data<-read.table(".//Power Data//household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
data<-transform(data, Date=as.Date(Date, format = "%d/%m/%Y"), Time = strptime(Time, "%H:%M:%S"))
subdata<-data[data$Date == as.Date("2007/02/01") | data$Date == as.Date("2007/02/02"),]

png(filename="plot1.png", width=480, height=480)

hist(subdata$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red",xlim = c(0,6), ylim =c(0,1200),axes=FALSE,main = "")
title(main = "Global Active Power")
axis(side=1, at=c(0,2,4,6))
axis(side=2, at=c(0,200,400,600,800,1000,1200))

dev.off()
                
                

