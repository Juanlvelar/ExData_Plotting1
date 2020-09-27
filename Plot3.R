# Read the file
mydata<-read.table("household_power_consumption.txt",sep=";",header = TRUE)

# Convert the columns into Date and Numeric Classes
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$DateTime <- strptime(paste(mydata$Date,mydata$Time),
                            format = "%Y-%m-%d %H:%M:%S")
mydata$Sub_metering_1<-as.numeric(mydata$Sub_metering_1)
mydata$Sub_metering_2<-as.numeric(mydata$Sub_metering_2)
mydata$Sub_metering_3<-as.numeric(mydata$Sub_metering_3)

# Subseting dates
mydata<-subset(mydata,Date >= "2007-02-01" & Date <= "2007-2-2"  )

# Plot to Screen
with(powerConsum, plot(DateTime, Sub_metering_1, type = "n", xaxt = "n",xlab = "", ylab = "Energy sub metering"))

axis(side = 1, at = c(as.numeric(powerConsum$DateTime[1]),as.numeric(powerConsum$DateTime[1441]),as.numeric(powerConsum$DateTime[2880])),labels = c("Thu","Fri","Sat"))

with(powerConsum, lines(DateTime, Sub_metering_1))
with(powerConsum, lines(DateTime, Sub_metering_2, col = "red"))
with(powerConsum, lines(DateTime, Sub_metering_3, col = "blue"))

legend("topright",lty = 1, col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Save plot3 to a PNG file
dev.copy(device = png, width = 480, height = 480, file = "Plot3.png")
