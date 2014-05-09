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

with(nData,plot(Num,Global_active_power,xlab="",
ylab="Global Active Power (kilowatts)",xaxt="n",type="n"))
with(nData,lines(Num,Global_active_power))
axis(1, at=c(1,1441,2881), labels=c("Thu","Fri","Sat"))
dev.copy(png,file="plot2.png")
dev.off()