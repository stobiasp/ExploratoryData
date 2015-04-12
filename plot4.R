
#plot4
#data transformations
data1<-read.table("household_power_consumption.txt", sep=";",header=TRUE)
data1$Date2<-as.Date(data1$Date,format = "%d/%m/%Y")
data2<-subset(data1,data1$Date2>='2007-02-01'&data1$Date2<='2007-02-02')
rm(data1)

hd<-(subset(data2$Global_active_power,data2$Global_active_power!='?'))
hd<-as.numeric(as.character(hd))

data2$Global_active_power<-as.numeric(as.character(data2$Global_active_power))
data2$Date3<-as.POSIXlt(paste(as.character(data2$Date2), as.character(format(data2$Time,format='%X') ),sep=" "))
data2$Global_active_power<-as.numeric(as.character(data2$Global_active_power))

data2$Sub_metering_1<-as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2<-as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3<-as.numeric(as.character(data2$Sub_metering_3))
data2$Global_reactive_power<-as.numeric(as.character(data2$Global_reactive_power))
data2$Voltage<-as.numeric(as.character(data2$Voltage))


#plot 1
png("plot4.png")

par(mfrow=c(2,2))


plot(data2$Date3,data2$Global_active_power
     ,col="black"
     , ylab="Global Active Power"
     ,xlab=""
     ,type="l"
     
)


#plot 2

plot(data2$Date3,data2$Voltage
     ,col="black"
     , ylab="Voltage"
     ,xlab="datetime"
     ,type="l"
     
)




#plot3


plot(data2$Date3,data2$Sub_metering_1
     ,col="black"
     #,main="Global Active Power"
     , ylab="Energy sub metering"
     ,xlab=""
     ,type="l"
     #,ylim=c(0,40)
     
)
lines(data2$Date3,data2$Sub_metering_2,col="red",lwd=2.5)
lines(data2$Date3,data2$Sub_metering_3,col="blue",lwd=2.5)
legend("topright"
       , c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lty=c(1,1)
       ,col=c("black","red","blue")
       ,bty = "n" 
)






plot(data2$Date3,data2$Global_reactive_power
     ,col="black"
     ,ylab="Global_reactive_power"
     ,xlab="datetime"
     ,type="b"
     ,pch=16
     ,cex=.5
     
)
dev.off()



