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


##Plot #1
##scale data
dataplot1 <- as.numeric(dataplot$Global_active_power)
## plot histogram into the PNGfile
png("plot1.png")
hist (dataplot1,  xlim = c(0, 6), ylim = c(0, 1200), col ="red",main = "GlobalActive Power", xlab = "Global Active Power (kilowatts)")
dev.off()

#code for creating the PNG file
## not needed becuase it's a built-in function into R


Plot #2

Plot #3

Plot #4

