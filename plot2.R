plot2.R<-function(datafile) {
    datafile<-"household_power_consumption.txt"
    
    if (!file.exists(datafile)) {
        exit("The file does not exist")
    }
    
    library(data.table)
    plotdata <- fread(datafile, na.strings = "?")
    
    plotdata[,DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
    
    library(dplyr)
    plotdatafiltered <- filter(plotdata, DateTime >= as.POSIXct("2007-02-01 00:00:00"), DateTime < as.POSIXct("2007-02-03 00:00:00"))
     
    png(file="plot2.png", width = 480, height = 480, unit = "px")
    
    plot(plotdatafiltered$DateTime, plotdatafiltered$Global_active_power, type="l", lwd=1, xlab="", ylab="Global Active Power (kilowatts)")

    dev.off()
}