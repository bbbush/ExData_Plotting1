library(data.table)
readData <- function(file="household_power_consumption.txt", nrows=2880, skip=66637){
  fieldNames <- fread(file, nrows=0)
  dt <- fread(file, na.strings="?", nrows=nrows, skip=skip, colClasses=c())
  setnames(dt, names(fieldNames))
  #http://stackoverflow.com/questions/21487614/error-creating-r-data-table-with-date-time-posixlt
  dt[,"Time"]<-as.ITime(strptime(dt$Time, "%H:%M:%S"))
  dt[,"Date"]<-as.Date(dt$Date, format="%d/%m/%Y")
  dt[,"Timect":=as.POSIXct(strptime(paste(dt$Date, dt$Time), "%Y-%m-%d %H:%M:%S"))]
  dt
}