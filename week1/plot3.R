##Reading data from Working Directory
data<-read.table("household_power_consumption.txt",sep = ";",header=TRUE,na.strings = "?")

##Getting onle relevant data for 2007-02-01 and 2007-02-02
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data_required<-data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]

##Combining Date and Time variables for further Datetime usage
datetime <- paste(as.Date(data_required$Date), data_required$Time)
data_required$Datetime <- as.POSIXct(datetime)

##Creating plot
par(mfrow=c(1,1))
par(mar=c(5,4,3,2)+0,1)
with(data,{plot(Sub_metering_1~Datetime,data_required,type="s",ylab="Energy Sub metering",xlab="")
           lines(Sub_metering_2~Datetime,data_required,type="s",col="red")
           lines(Sub_metering_3~Datetime,data_required,type="s",col="blue")})
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,cex=0.8)

##Exporting plot to a png file
dev.copy(device = png,file ="plot3.png",width=480,height=480)
dev.off()