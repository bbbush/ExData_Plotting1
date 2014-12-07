source("readData.R")
do.plot3<-function(){
  dt<-readData()
  time.range<-c(min(dt$Timect), max(dt$Timect))
  meter.range<-c(min(c(dt$Sub_metering_1, dt$Sub_metering_2, dt$Sub_metering3)),max(c(dt$Sub_metering_1, dt$Sub_metering_2, dt$Sub_metering3)))
  plot(time.range, meter.range, type="n", ylab="Energy sub metering", xlab="")
  lines(dt$Timect, dt$Sub_metering_1, type="l", col="black")
  lines(dt$Timect, dt$Sub_metering_2, type="l", col="red")
  lines(dt$Timect, dt$Sub_metering_3, type="l", col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
}
plot3<-function(){
  png("figure/plot3.png", width=480, height=480)
  do.plot3()
  dev.off()
}