plot3.R<-function(datafile) {
    datafile<-"household_power_consumption.txt"
    
    if (!file.exists(datafile)) {
        exit("The file does not exist")
    }
    
    library(data.table)
    plotdata <- fread(datafile, na.strings = "?")
    
    plotdata[,DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
    
    library(dplyr)
    plotdatafiltered <- filter(plotdata, DateTime >= as.POSIXct("2007-02-01 00:00:00"), DateTime < as.POSIXct("2007-02-03 00:00:00"))
     
    png(file="plot3.png", width = 480, height = 480, unit = "px")
    
    plot(plotdatafiltered$DateTime, plotdatafiltered$Sub_metering_1, type="l", lwd=1, xlab="", ylab="Energy sub metering")
    lines(plotdatafiltered$DateTime, plotdatafiltered$Sub_metering_2, type="l", col="red", lwd=1)
    lines(plotdatafiltered$DateTime, plotdatafiltered$Sub_metering_3, type="l", col="blue", lwd=1)
    
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lty=1)
    
    dev.off()
}