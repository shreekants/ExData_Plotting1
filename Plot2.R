

mydata <- read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880,
                     col.names = colnames(read.table("household_power_consumption.txt", 
                                                     nrow=1,header = TRUE,sep = ";")))
head(mydata)
tail(mydata)

mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")

mydata$Time = strftime(as.POSIXct(strptime(mydata$Time, format="%H:%M:%S"),format="%H:%M:%S"),format="%H:%M:%S")


datetime <- as.POSIXct(paste0(mydata$Date,mydata$Time))


plot.new()

plot(datetime,mydata$Global_active_power, type="n", ylab ="Global Active Power (kilowatts)", xlab="")
lines(datetime,mydata$Global_active_power)


dev.copy(png, file="plot2.png")
dev.off() 

