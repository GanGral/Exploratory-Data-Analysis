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
hist(data_required$Global_active_power,col="Red",main = "Global Active Power", xlab="Global Active Power (killowats)")

##Exporting plot to a png file
dev.copy(device = png,file ="plot1.png",width=480,height=480)
dev.off()