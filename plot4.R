

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


##plot 4 

plot4<- function(){
  par(mfrow=c(2,2))
  #plot 1
  plot(powerdata$datetime, powerdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  
  #plot2
  plot(powerdata$datetime, powerdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  #plot3
  plot(powerdata$datetime, powerdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(powerdata$datetime, powerdata$Sub_metering_2, type = "l", col="red")
  lines(powerdata$datetime, powerdata$Sub_metering_3, type="l", col="blue")
  legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  "), lty=c(1,1), bty="n", cex=.5)
  
  #plot4
  plot(powerdata$datetime, powerdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
}

plot4()

