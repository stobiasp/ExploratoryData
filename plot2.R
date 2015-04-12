
#plot 2
png("plot2.png")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","hhpc.zip")
data1<-read.table("household_power_consumption.txt", sep=";",header=TRUE)
data1$Date2<-as.Date(data1$Date,format = "%d/%m/%Y")
data2<-subset(data1,data1$Date2>='2007-02-01'&data1$Date2<='2007-02-02')
rm(data1)

data2$Date3<-as.POSIXlt(paste(as.character(data2$Date2), as.character(format(data2$Time,format='%X') ),sep=" "))

data2$Global_active_power<-as.numeric(as.character(data2$Global_active_power))


plot(data2$Date3,data2$Global_active_power
     ,col="black"
     #,main="Global Active Power"
     , ylab="Global Active Power (kilowatts)"
     ,xlab=""
     ,type="l"
     
)
dev.off()
