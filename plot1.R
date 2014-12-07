source("readData.R")
do.plot1<-function(){
  dt<-readData()
  hist(dt$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
}
plot1<-function(){
  png("figure/plot1.png", width=480, height=480)
  do.plot1()
  dev.off()
}