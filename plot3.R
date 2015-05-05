plot3 <- function() {
        ## read data
        data <- read.table ("household_power_consumption.txt", sep=";", header=TRUE)
        select <- data[data[,1] %in% c("1/2/2007", "2/2/2007"), ]
        ## prepare data format
        select$DateTime <- paste(select$Date, select$Time)
        select$DateTime <- strptime(select$DateTime, "%d/%m/20%y %H:%M:%S")
        select$Sub_metering_1 <- as.character(select$Sub_metering_1)
        select$Sub_metering_1 <- as.numeric(select$Sub_metering_1)
        select$Sub_metering_2 <- as.character(select$Sub_metering_2)
        select$Sub_metering_2 <- as.numeric(select$Sub_metering_2)
        ## construct plot on engery sub metering
        png(file = "plot3.png", width=480, height=480)
        plot(select$DateTime, select$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=NA)
        points(select$DateTime, select$Sub_metering_2, type="l", col="red")
        points(select$DateTime, select$Sub_metering_3, type="l", col="blue")
        legend("topright", lty="solid", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.off()
}