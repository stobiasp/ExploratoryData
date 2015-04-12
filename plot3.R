#plot3
png("plot3.png")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","hhpc.zip")
data1<-read.table("household_power_consumption.txt", sep=";",header=TRUE)
data1$Date2<-as.Date(data1$Date,format = "%d/%m/%Y")
data2<-subset(data1,data1$Date2>='2007-02-01'&data1$Date2<='2007-02-02')
rm(data1)

data2$Date3<-as.POSIXlt(paste(as.character(data2$Date2), as.character(format(data2$Time,format='%X') ),sep=" "))

data2$Global_active_power<-as.numeric(as.character(data2$Global_active_power))
data2$Sub_metering_1<-as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2<-as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3<-as.numeric(as.character(data2$Sub_metering_3))

plot(data2$Date3,data2$Sub_metering_1
     ,col="black"
     , ylab="Energy sub metering"
     ,xlab=""
     ,type="l"
          
)
lines(data2$Date3,data2$Sub_metering_2,col="red",lwd=2.5)
lines(data2$Date3,data2$Sub_metering_3,col="blue",lwd=2.5)
legend("topright"
       , c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       #, title = "bottomright"
       ,lty=c(1,1)
       ,col=c("black","red","blue")
)
dev.off()
