##Reading data from Working Directory
data<-read.table("household_power_consumption.txt",sep = ";",header=TRUE,na.strings = "?")

##Getting onle relevant data for 2007-02-01 and 2007-02-02
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data_required<-data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]

##Combining Date and Time variables for further Datetime usage
datetime <- paste(as.Date(data_required$Date), data_required$Time)
data_required$Datetime <- as.POSIXct(datetime)

##Creating plots
par(mfrow=c(2,2))
plot(Global_active_power~Datetime,data_required, type="l", ylab="Global Active Power", xlab="")
plot(Voltage~Datetime,data_required,type="l",ylab="Voltage",xlab="datetime")
with(data,{
           plot(Sub_metering_1~Datetime,data_required,type="s",ylab="Energy Sub metering",xlab="")
           lines(Sub_metering_2~Datetime,data_required,type="s",col="red")
           lines(Sub_metering_3~Datetime,data_required,type="s",col="blue")
           legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,cex=0.7,text.width=70000,inset=0.01,box.col="white")
           })
plot(Global_reactive_power~Datetime,data_required, type="l", xlab="datetime")

##Exporting plot to a png file
dev.copy(device = png,file ="plot4.png",width=480,height=480)
dev.off()