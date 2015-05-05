plot4 <- function() {
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
        select$Voltage <- as.character(select$Voltage)
        select$Voltage <- as.numeric(select$Voltage)
        select$Global_reactive_power <- as.character(select$Global_reactive_power)
        select$Global_reactive_power <- as.numeric(select$Global_reactive_power)
        select$Global_active_power <- as.character(select$Global_active_power)
        select$Global_active_power <- as.numeric(select$Global_active_power)
        ## construct integrated graph
        png(file = "plot4.png", width=480, height=480)
        par(mfrow=c(2,2))
        with(select, {
                plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", 
                     xlab=NA)
                plot(DateTime, Voltage, type="l", ylab="Voltage", xlab="datetime")
                
                plot(select$DateTime, select$Sub_metering_1, type="l", ylab="Energy sub metering", 
                     xlab=NA)
                points(DateTime, Sub_metering_2, type="l", col="red")
                points(DateTime, Sub_metering_3, type="l", col="blue")
                legend("topright", lty="solid", col=c("black", "red", "blue"), 
                       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
                
                plot(DateTime, Global_reactive_power, type="l", ylab="Global_reactive_power", 
                     xlab="datetime")  
        })
        dev.off()
}