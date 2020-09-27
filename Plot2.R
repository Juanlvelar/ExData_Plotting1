# Read the file
mydata<-read.table("household_power_consumption.txt",sep=";",header = TRUE)

# Convert the columns into Date and Numeric Classes
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$DateTime <- strptime(paste(mydata$Date,mydata$Time),
                            format = "%Y-%m-%d %H:%M:%S")
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)

# Subseting dates
mydata<-subset(mydata,Date >= "2007-02-01" & Date <= "2007-2-2"  )

# Plot to Screen
with(mydata, plot(DateTime, Global_active_power, type = "l", xlab = "",ylab = "Global Active Power (kilowatts)", xaxt = "n"))

axis(side = 1, at = c(as.numeric(mydata$DateTime[1]),as.numeric(mydata$DateTime[1441]),as.numeric(mydata$DateTime[2880])),labels = c("Thu","Fri","Sat"))

#Save plot2 to a PNG file
dev.copy(device = png, width = 480, height = 480, file = "Plot2.png")
