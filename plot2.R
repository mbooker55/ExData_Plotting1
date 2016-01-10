##Download data file and extract in working directory
##Load data to variable
dataFile<-"household_power_consumption.txt"

##Read contents to df keep the string values of Global_active_power 
data<-read.table(dataFile, header=TRUE,sep=";", stringsAsFactors=FALSE,dec=".")

##Extract just the days of interest
febData<-subset(data,data$Date %in% c("1/2/2007", "2/2/2007"))

##Make Global_active_power numeric values
globalActivePower<- as.numeric(febData$Global_active_power)

##Reformat date time from data fields
datetime<- strptime(paste(febData$Date, febData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##Open the Plot in PNG file and Set Plot parameters as required
png("plot2.png", width=480, height=480)

##Produce the plot use type as lines
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

##Close Graphics device
dev.off()