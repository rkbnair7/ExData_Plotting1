setwd("C:\\DS")
pcs<-read.csv("C:\\DS\\household_power_consumption.csv", 
                sep=";",
                dec=".", 
                stringsAsFactors= FALSE,
                na.strings = "?",
                colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric","numeric", "numeric", "numeric")
)

subSet_pcs <- pcs[pcs$Date %in% c("1/2/2007", "2/2/2007"),]
str(subSet_pcs)
hist(plot, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()