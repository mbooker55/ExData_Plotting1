##Download file and extract in working directory
##Load data to variable
dataFile<-"household_power_consumption.txt"

##Read contents to df keep the string values of Global_active_power 
data<-read.table(dataFile, header=TRUE,sep=";", stringsAsFactors=FALSE,dec=".")

##Extract just the days of interest
febData<-subset(data,data$Date %in% c("1/2/2007", "2/2/2007"))

##Make Global_active_power numeric values
globalActivePower<- as.numeric(febData$Global_active_power)

globalReactivePower<- as.numeric(febData$Global_reactive_power)
voltage<- as.numeric(febData$Voltage)

##Reformat date time from data fields
datetime<- strptime(paste(febData$Date, febData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##
##Get submetering data
subMetering1<- as.numeric(febData$Sub_metering_1)
subMetering2<- as.numeric(febData$Sub_metering_2)
subMetering3<- as.numeric(febData$Sub_metering_3)

##Open the Plot in PNG file and Set Plot parameters as required
png("plot4.png", width=480, height=480)

##Create rows and columns for 4 graphs
par(mfrow=c(2,2))

##Plot row 1 col 1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

##Plot row1 col 2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

##Plot row2 col 1
##Produce the plot use type as lines include all 3 submetering values
plot(datetime, subMetering1, type="l", xlab="",  ylab="Energy Submetering")
lines(datetime,subMetering2, type="l", col="red")
lines(datetime,subMetering3, type="l", col="blue")

##Create the legend with no box around it
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=2.5, lty=1, col=c("black","red","blue"),bty="n")

##Plot row 2 col 2
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_Power")

##Close Graphics device
dev.off()