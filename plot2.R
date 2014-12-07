source("readData.R")
do.plot2<-function(){
  dt<-readData()
  plot(dt$Timect, dt$Global_active_power, type="l", col="black", ylab="Global Active Power (kilowatts)", xlab="")
}
plot2<-function(){
  png("figure/plot2.png", width=480, height=480)
  do.plot2()
  dev.off()
}