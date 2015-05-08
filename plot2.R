## Exploratory data Analysis - Assignment 1
## Read data  
options(stringsAsFactors=FALSE)
dt<-read.table("household_power_consumption.txt",header = TRUE, sep=";")

##Conver date 
dt$Date <- as.Date(dt$Date, "%d/%m/%Y")

##Filter data
Filter1 <- as.Date("2007-02-01")
Filter2 <- as.Date("2007-02-02")
dataplot<- subset(dt, dt$Date %in% c(Filter1,Filter2), select =Date:Global_active_power)


Plot #2
##format data - Factor --< character -->numeris
dataY <- as.numeric(as.character(dataplot$Global_active_power))
## creaye x axis (Thu, Fri,Sa)
date_time <- (1:length(dataplot$Date)
for (i in 1:length(dataplot$Date)) 
{ date_time[i] <- paste( as.character (dataplot$Date[i]) ,as.character(dataplot$Time[i]))
}
dataX <- strptime(date_time ,"%Y-%m-%d %H:%M:%S")

## ## plot histogram into the PNGfile
png("plot2.png")
plot(dataX,dataY, type="l", ylim=c(0,8), xlab="", ylab="Gobal Active Power(kilowatts)")
dev.off()
