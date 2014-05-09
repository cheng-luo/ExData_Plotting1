# read data
oriData=read.table("household_power_consumption.txt",header=T,
                   sep=";",na.strings="?")

# convert Date from factor to character
oData=transform(oriData,Date=as.character(Date))
# subset 
nData=subset(oData,Date=="1/2/2007" | Date=="2/2/2007")

# convert Date from character to Date
oData=transform(nData,Date=strptime(Date,"%d/%m/%Y"))

# convert Time from factor to character
nData=transform(oData,Time=as.character(Time))

OData=transform(nData,Weekday=Date$wday)

nData=transform(OData,Num=seq(1,dim(OData)[1]))

par(mfrow=c(2,2))
par(mar=c(4,4,2,1))

# figure 1
with(nData,plot(Num,Global_active_power,xlab="",
                ylab="Global Active Power",xaxt="n",type="n"))
with(nData,lines(Num,Global_active_power))
axis(1, at=c(1,1441,2881), labels=c("Thu","Fri","Sat"))

# figure 2
with(nData,plot(Num,Voltage,xlab="datetime",
                ylab="Voltage",xaxt="n",type="n"))
with(nData,lines(Num,Voltage))
axis(1, at=c(1,1441,2881), labels=c("Thu","Fri","Sat"))


# figure 3
with(nData,plot(Num,Sub_metering_1,xlab="",
                ylab="Energe sub metering",xaxt="n",type="n"))
with(nData,lines(Num,Sub_metering_1,col="Black"))
with(nData,lines(Num,Sub_metering_2,col="Red"))
with(nData,lines(Num,Sub_metering_3,col="Blue"))
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       cex=0.5,bty="n")


axis(1, at=c(1,1441,2881), labels=c("Thu","Fri","Sat"))

# figure 4
with(nData,plot(Num,Global_reactive_power,xlab="datetime",
                xaxt="n",type="n"))
with(nData,lines(Num,Global_reactive_power))
axis(1, at=c(1,1441,2881), labels=c("Thu","Fri","Sat"))

dev.copy(png,file="plot4.png")
dev.off()