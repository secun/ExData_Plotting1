## Exploratory data Analysis - Assignment 1
## Read data  
options(stringsAsFactors=FALSE)
dt<-read.table("household_power_consumption.txt",header = TRUE, sep=";")

##Conver date 
dt$Date <- as.Date(dt$Date, "%d/%m/%Y")

##Filter data
Filter1 <- as.Date("2007-02-01")
Filter2 <- as.Date("2007-02-02")
dataplot<- subset(dt, dt$Date %in% c(Filter1,Filter2), select =Date:Sub_metering_3)

## Format data
dataplot$Global_active_power <- as.numeric(as.character(dataplot$Global_active_power))
dataplot$Global_reactive_power <- as.numeric(as.character(dataplot$Global_reactive_power))
dataplot$Voltage <- as.numeric(as.character(dataplot$Voltage))
dataplot$Sub_metering_1 <- as.numeric(as.character(dataplot$Sub_metering_1))
dataplot$Sub_metering_2 <- as.numeric(as.character(dataplot$Sub_metering_2))
date_time <- (1:length(dataplot$Date))
for (i in 1:length(dataplot$Date)) 
{ date_time[i] <-   
    paste( as.character (dataplot$Date[i]) ,as.character(dataplot$Time[i]))
  
}
dataplot$Date <- strptime(date_time ,"%Y-%m-%d %H:%M:%S")

## ## plot 4 into the PNGfile
png("plot4.png")
#4 graphs in the same window
par(mfrow=c(2,2))
##Plot#1
plot(dataplot$Date,dataplot$Global_active_power, type="l", ylim=c(0,6), xlab="", ylab="Gobal Active Power(kilowatts)")
##Plot#2
plot(dataplot$Date,dataplot$Voltage, type="l",ylim=c(233,246), xlab="datetime", ylab="Voltage")
##Plot#3
with (dataplot, {
  plot (Date,Sub_metering_1,type="l", xlab="",ylim = c(0,40) ,ylab="Energy sub metering")
  par (new=TRUE) ## add graphs to the existing
  plot (Date,Sub_metering_2,type="l",col="red",ylim = c(0,40), xlab="",ylab="" )
  par (new=TRUE) ## add graphs to the existing
  plot (Date,Sub_metering_3,type="l", col="blue", ylim = c(0,40), xlab="",ylab="")
  par (new=TRUE) ## add graphs to the existing
  legend("topright", lty=c(1,1), col = c("black","blue","red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
})

##Plot#4
plot(dataplot$Date,dataplot$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
