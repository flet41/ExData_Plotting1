

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



##Plot2
par(mfrow=c(1,1))
plot2<-function(){
  plot(powerdata$datetime, powerdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.copy(png,file="plot2.png", width=480, height=480)
  dev.off()
}
plot2()
