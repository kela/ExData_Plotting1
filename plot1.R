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
# construct histograms
hist(file$Global_active_power, col="orangered", xlab="Global Active Power (kilowatts)", main ='Global Active Power' )
#save histogram to png file
dev.copy(png, file="plot1.png")
dev.off()