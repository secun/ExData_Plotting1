## Exploratory data Analysis - Assignment 1
## Read data  

dt<-read.table("household_power_consumption.txt",header = TRUE, sep=";")

##Conver date 
dt$Date <- as.Date(dt$Date, "%d/%m/%Y")

##Filter data
Filter1 <- as.Date("2007-02-01")
Filter2 <- as.Date("2007-02-02")
dataplot<- subset(dt, dt$Date %in% c(Filter1,Filter2), select =Date:Sub_metering_3)

## Format data
dataplot$Sub_metering_1 <- as.numeric(as.character(dataplot$Sub_metering_1))
dataplot$Sub_metering_2 <- as.numeric(as.character(dataplot$Sub_metering_2))
dataplot$Sub_metering_3 <- as.numeric(as.character(dataplot$Sub_metering_3))
date_time <- (1:length(dataplot$Date))
              for (i in 1:length(dataplot$Date)) 
              { date_time[i] <-   
                  paste( as.character (dataplot$Date[i]) ,as.character(dataplot$Time[i]))
                
              }
dataplot$Date <- strptime(date_time ,"%Y-%m-%d %H:%M:%S")
  
              
##Plot #3
## ## plot histogram into the PNGfile

png("plot3.png")

with (dataplot, {
      plot (Date,Sub_metering_1,type="l", xlab="",ylim = c(0,40) ,ylab="Energy sub metering")
      par (new=TRUE) ## add graphs to the existing
      plot (Date,Sub_metering_2,type="l",col="red",ylim = c(0,40), xlab="",ylab="" )
      par (new=TRUE) ## add graphs to the existing
      plot (Date,Sub_metering_3,type="l", col="blue", ylim = c(0,40), xlab="",ylab="")
      par (new=TRUE) ## add graphs to the existing
      legend("topright", lty=c(1,1), col = c("black","blue","red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
})

dev.off()