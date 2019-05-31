setwd("C:\\DS")
pcs<-read.csv("C:\\DS\\household_power_consumption.csv", 
              sep=";",
              dec=".", 
              stringsAsFactors= FALSE,
              na.strings = "?",
              colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric","numeric", "numeric", "numeric")
)


pcs$Date <- as.Date(pcs$Date, format="%d/%m/%Y")
subSet_pcs <- pcs[(pcs$Date=="2007-02-01") | (pcs$Date=="2007-02-02"),]

subSet_pcs$Global_active_power <- as.numeric(as.character(subSet_pcs$Global_active_power))
subSet_pcs$Global_reactive_power <- as.numeric(as.character(subSet_pcs$Global_reactive_power))
subSet_pcs$Voltage <- as.numeric(as.character(subSet_pcs$Voltage))
subSet_pcs <- transform(subSet_pcs, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
subSet_pcs$Sub_metering_1 <- as.numeric(as.character(subSet_pcs$Sub_metering_1))
subSet_pcs$Sub_metering_2 <- as.numeric(as.character(subSet_pcs$Sub_metering_2))
subSet_pcs$Sub_metering_3 <- as.numeric(as.character(subSet_pcs$Sub_metering_3))

plot(subSet_pcs$timestamp,subSet_pcs$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(subSet_pcs$timestamp,subSet_pcs$Sub_metering_2,col="red")
  lines(subSet_pcs$timestamp,subSet_pcs$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

  dev.copy(png, file="plot3.png", width=480, height=480)
  dev.off()
  
  