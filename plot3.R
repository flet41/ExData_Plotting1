

#Get Data
power<-read.table("household_power_consumption.txt", header = TRUE, sep=";")  

#Subset Data
power$Date<-as.Date(power$Date, "%d/%m/%Y")
powerdata<-power[(power$Date=="2007-02-01")|(power$Date=="2007-02-02"),]

#Convert Classes to numeric
powerdata$Global_active_power<-as.numeric(powerdata$Global_active_power)
powerdata$Voltage<-as.numeric(powerdata$Voltage)


#Create time column 
powerdata<-transform(powerdata,datetime=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")



##plot3

par(mfrow=c(1,1))
plot3<-function(){
  plot(powerdata$datetime, powerdata$Sub_metering_1, type="l", xlab="", ylab="Energy Sub metering")
  lines(powerdata$datetime, powerdata$Sub_metering_2, col="red")
  lines(powerdata$datetime, powerdata$Sub_metering_3, col="blue")
  legend("topright", col=c("black", "red", "blue"),c("Sub_metering_1   ", "Sub_metering_2  ", "Sub_metering_3  "), lty=c(1, 1), lwd=c(1,1))
  dev.copy(png, file="plot3.png", width=480, height=480)
  dev.off()
}
plot3()
