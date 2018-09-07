

mydata <- read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880,
                     col.names = colnames(read.table("household_power_consumption.txt", 
                                                     nrow=1,header = TRUE,sep = ";")))

mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")

mydata$Time = strftime(as.POSIXct(strptime(mydata$Time, format="%H:%M:%S"),format="%H:%M:%S"),format="%H:%M:%S")


datetime <- as.POSIXct(paste0(mydata$Date,mydata$Time))

head(mydata)


png(file="plot4.png", width=480, height=480, unit="px")

par(mfrow=c(2,2))

#plot 1
plot(datetime,mydata$Global_active_power, type="n", ylab ="Global Active Power (kilowatts)", xlab="")
lines(datetime,mydata$Global_active_power)

#plot 2
plot(datetime,mydata$Voltage, type="n", ylab ="Voltage", xlab="datetime")
lines(datetime,mydata$Voltage)


#plot 3
plot(datetime,mydata$Sub_metering_1, type="n", ylab ="Energy sub metering", xlab="")
lines(datetime,mydata$Sub_metering_1)
lines(datetime,mydata$Sub_metering_2, col="red")
lines(datetime,mydata$Sub_metering_3, col="blue")
legend("topright", border=False, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
col=c("black","red","blue"), lwd=1)


#plot 4
plot(datetime,mydata$Global_reactive_power, type="n", ylab ="Global_reactive_power", xlab="datetime")
lines(datetime,mydata$Global_reactive_power)

dev.off() 

