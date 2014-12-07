source("readData.R")
do.plot4<-function(){
  dt<-readData()
  par(mfrow=c(2,2), mar=c(5, 4, 3, 1))
  #plot1
  plot(dt$Timect, dt$Global_active_power, type="l", ylab="Global Active Power", xlab="")
  #plot2
  plot(dt$Timect, dt$Voltage, type="l", ylab="Voltage", xlab="datetime")
  #plot3
  time.range<-c(min(dt$Timect), max(dt$Timect))
  meter.range<-c(min(c(dt$Sub_metering_1, dt$Sub_metering_2, dt$Sub_metering3)),max(c(dt$Sub_metering_1, dt$Sub_metering_2, dt$Sub_metering3)))
  plot(time.range, meter.range, type="n", ylab="Energy sub metering", xlab="")
  lines(dt$Timect, dt$Sub_metering_1, type="l", col="black")
  lines(dt$Timect, dt$Sub_metering_2, type="l", col="red")
  lines(dt$Timect, dt$Sub_metering_3, type="l", col="blue")
  legend("topright", bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
  #plot4
  plot(dt$Timect, dt$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
}
plot4<-function(){
  png("figure/plot4.png", width=480, height=480)
  do.plot4()
  dev.off()
}
