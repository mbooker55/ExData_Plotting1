##Download data file and extract in working directory
##Load data to variable
dataFile<-"household_power_consumption.txt"

##Read contents to df keep the string values of Global_active_power 
data<-read.table(dataFile, header=TRUE,sep=";", stringsAsFactors=FALSE,dec=".")

##Extract just the days of interest
febData<-subset(data,data$Date %in% c("1/2/2007", "2/2/2007"))

##Make Global_active_power numeric values
globalActivePower<- as.numeric(febData$Global_active_power)

##Open the Plot in PNG file and Set Plot parameters as required
png("plot1.png", width=480, height=480)

##Produce the plot
hist(globalActivePower, xlab="Global Active Power (kilowatts)", main="Global Active Power",col="red")

##Close Graphics device
dev.off()