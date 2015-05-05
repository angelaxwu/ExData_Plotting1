plot2 <- function() {
        ## read data
        data <- read.table ("household_power_consumption.txt", sep=";", header=TRUE)
        select <- data[data[,1] %in% c("1/2/2007", "2/2/2007"), ]
        ## prepare data format
        select$DateTime <- paste(select$Date, select$Time)
        select$DateTime <- strptime(select$DateTime, "%d/%m/20%y %H:%M:%S")
        select$Global_active_power <- as.character(select$Global_active_power)
        select$Global_active_power <- as.numeric(select$Global_active_power)
        ## construct plot on Global_active_power
        png(file = "plot2.png", width=480, height=480)
        plot(select$DateTime, select$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=NA)
        dev.off()
}