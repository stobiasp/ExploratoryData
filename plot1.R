#plot 1
png("plot1.png")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","hhpc.zip")
data1<-read.table("household_power_consumption.txt", sep=";",header=TRUE)
data1$Date2<-as.Date(data1$Date,format = "%d/%m/%Y")
data2<-subset(data1,data1$Date2>='2007-02-01'&data1$Date2<='2007-02-02')
rm(data1)
hd<-(subset(data2$Global_active_power,data2$Global_active_power!='?'))
hd<-as.numeric(as.character(hd))
hist(hd,breaks=13,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)",ylim=c(0,1200),cex=.1)
dev.off()

