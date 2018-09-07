

mydata <- read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880,
                     col.names = colnames(read.table("household_power_consumption.txt", 
                                                     nrow=1,header = TRUE,sep = ";")))
head(mydata)
tail(mydata)

mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")

mydata$Time = strftime(as.POSIXct(strptime(mydata$Time, format="%H:%M:%S"),format="%H:%M:%S"),format="%H:%M:%S")

plot.new()
hist(mydata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Gobal Active Power")

dev.copy(png, file="plot1.png")
dev.off() 

