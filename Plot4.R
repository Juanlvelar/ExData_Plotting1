# Read the file
mydata<-read.table("household_power_consumption.txt",sep=";",header = TRUE)

# Convert the columns into Date and Numeric Classes
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$DateTime <- strptime(paste(mydata$Date,mydata$Time),format = "%Y-%m-%d %H:%M:%S")

mydata$Global_active_power<-as.numeric(mydata$Global_active_power)
mydata$Global_reactive_power<-as.numeric(mydata$Global_reactive_power)
mydata$Voltage<-as.numeric(mydata$Voltage)
mydata$Sub_metering_1<-as.numeric(mydata$Sub_metering_1)
mydata$Sub_metering_2<-as.numeric(mydata$Sub_metering_2)
mydata$Sub_metering_3<-as.numeric(mydata$Sub_metering_3)

# Subseting dates
mydata<-subset(mydata,Date >= "2007-02-01" & Date <= "2007-2-2"  )

# Plot to Screen
par(mfrow = c(2,2))

#Plot at topleft
with(mydata, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", xaxt = "n",cex.axis=0.75))
axis(side = 1, at = c(as.numeric(mydata$DateTime[1]),as.numeric(mydata$DateTime[1441]),as.numeric(mydata$DateTime[2880])),labels = c("Thu","Fri","Sat"))

#Plot at topright
with(mydata, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage",xaxt = "n",cex.axis=0.75))
axis(side = 1, at = c(as.numeric(mydata$DateTime[1]),as.numeric(mydata$DateTime[1441]),as.numeric(mydata$DateTime[2880])),labels = c("Thu","Fri","Sat"))

#Plot at bottomleft
with(mydata, plot(DateTime, Sub_metering_1, type = "n", xaxt = "n",xlab = "", ylab = "Energy sub metering",cex.axis=0.75))
axis(side = 1, at = c(as.numeric(mydata$DateTime[1]),as.numeric(mydata$DateTime[1441]),as.numeric(mydata$DateTime[2880])),labels = c("Thu","Fri","Sat"))

with(mydata, lines(DateTime, Sub_metering_1))
with(mydata, lines(DateTime, Sub_metering_2, col = "red"))
with(mydata, lines(DateTime, Sub_metering_3, col = "blue"))

legend("topright",lty = 1, col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.5)

#Plot at bottomright
with(mydata, plot(DateTime, Global_reactive_power, type= "l", xlab = "datetime", ylab = "Global_reactive_power", xaxt = "n",cex.axis=0.75))
axis(side = 1, at = c(as.numeric(mydata$DateTime[1]),as.numeric(mydata$DateTime[1441]),as.numeric(mydata$DateTime[2880])),labels = c("Thu","Fri","Sat"))

#Save plot4 to a PNG file
dev.copy(device = png, width = 480, height = 480, file = "Plot4.png")

