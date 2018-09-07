

mydata <- read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880,
                     col.names = colnames(read.table("household_power_consumption.txt", 
                                                     nrow=1,header = TRUE,sep = ";")))
head(mydata)
tail(mydata)

mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")

mydata$Time = strftime(as.POSIXct(strptime(mydata$Time, format="%H:%M:%S"),format="%H:%M:%S"),format="%H:%M:%S")


datetime <- as.POSIXct(paste0(mydata$Date,mydata$Time))


plot.new()

plot(datetime,mydata$Sub_metering_1, type="n", ylab ="Energy sub metering", xlab="")
lines(datetime,mydata$Sub_metering_1)

lines(datetime,mydata$Sub_metering_2, col="red")
lines(datetime,mydata$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lwd=1)


dev.copy(png, file="plot3.png")
dev.off() 

