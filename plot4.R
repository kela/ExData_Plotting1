#setting Wd
setwd("C:/formation/plotting")
# Load whole file
fileG<-read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
# set column names
names(fileG)<-fileG[1, ]
#converting date and time
#fileG$Date <- as.Date(fileG$Date, "%d/%m/%Y")
#fileG$Time <- strptime(fileG$Time, "%H:%M:%S")
#subseeting file
file<- subset(fileG, (Date=="1/2/2007")| (Date=="2/2/2007") )
#converting varibale to numbers

file$Global_active_power<-as.numeric(file$Global_active_power)
file$Global_reactive_power<-as.numeric(file$Global_reactive_power)
file$Voltage<-as.numeric(file$Voltage)
file$Global_intensity<-as.numeric(file$Global_intensity)
file$Sub_metering_1<-as.numeric(file$Sub_metering_1)
file$Sub_metering_2<-as.numeric(file$Sub_metering_2)
file$Sub_metering_3<-as.numeric(file$Sub_metering_3)

par(mfrow=c(2,2))

plot(x=as.POSIXct(paste(file$Date, file$Time, sep= " "), format = "%d/%m/%Y %H:%M:%S"), y = file$Global_active_power, type="l", ylab="Global Active Power", xlab="")

plot(x=as.POSIXct(paste(file$Date, file$Time, sep= " "), format = "%d/%m/%Y %H:%M:%S"), y = file$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(x=as.POSIXct(paste(file$Date, file$Time, sep= " "), format = "%d/%m/%Y %H:%M:%S"), y = file$Sub_metering_1, col = "black", type="l", ylab="Energy sub metering", xlab="")
lines(x=as.POSIXct(paste(file$Date, file$Time, sep= " "), format = "%d/%m/%Y %H:%M:%S"), y = file$Sub_metering_2, col = "red")
lines(x=as.POSIXct(paste(file$Date, file$Time, sep= " "), format = "%d/%m/%Y %H:%M:%S"), y = file$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n")


plot(x=as.POSIXct(paste(file$Date, file$Time, sep= " "), format = "%d/%m/%Y %H:%M:%S"), y = file$Global_reactive_power, type="l", xlab="datetime")




#save plot to png file
dev.copy(png, file="plot4.png")
dev.off()