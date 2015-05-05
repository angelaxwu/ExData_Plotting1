plot1 <- function() {
        ## read data
        data <- read.table ("household_power_consumption.txt", sep=";", header=TRUE)
        select <- data[data[,1] %in% c("1/2/2007", "2/2/2007"), ]
        ## prepare data format
        select$Global_active_power <- as.character(select$Global_active_power)
        select$Global_active_power <- as.numeric(select$Global_active_power)
        ## construct histogram
        png(file = "plot1.png", width=480, height=480)
        hist(select$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
        dev.off()
}