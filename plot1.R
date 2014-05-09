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

# convert Time from character to Time
# oriData=transform(oData,Time=strptime(Time,"%H:%M:%S"))
hist(nData$Global_active_power,xlab="Global Active Power (kilowatts)",
     main="Global Active Power",col="red")
dev.copy(png,file="plot1.png")
dev.off()