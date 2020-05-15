plot1.R<-function() {
    
    datafile<-"household_power_consumption.txt"
    
    if (!file.exists(datafile)) {
        exit("The file does not exist")
    }
    
    library(data.table)
    plotdata <- fread(datafile, na.strings = "?")
    
    plotdata[,DateTime := as.Date(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
    
    library(dplyr)
    plotdatafiltered <- filter(plotdata, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))
     
    png(file="plot1.png", width = 480, height = 480, unit = "px")
    
    hist(plotdatafiltered$Global_active_power, col ="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
    
    dev.off()
}