electric <-read.table("household_power_consumption.txt", header = TRUE, sep = ";", as.is=T, na.string="?")
electric$Global_active_power <-as.numeric(electric$Global_active_power)
electric$Date <-as.Date(electric$Date, format = "%d/%m/%Y")
feb2007 <-electric[electric$Date >= "2007-02-01" & electric$Date <="2007-02-02",]
rm(electric)
x <-paste(feb2007$Date, feb2007$Time)
DateTime <-strptime(x, "%Y-%m-%d %H:%M:%S")

png("plot4.png", height = 480, width = 480)
par(mfrow=c(2,2))
    plot(DateTime, feb2007$Global_active_power, type="l", lty=1, xlab="", ylab="Global active power (kilowatts)")
        
    plot(DateTime, feb2007$Voltage, type="l", lty=1, xlab="datetime", ylab="Voltage")
    
    plot(DateTime, feb2007$Sub_metering_1, type="l", lty=1, xlab="", ylab= "Energy sub metering")
      lines(DateTime, feb2007$Sub_metering_2, type="l", lty=1, xlab="", ylab= "Energy sub metering", col= "red")
      lines(DateTime, feb2007$Sub_metering_3, type="l", lty=1, xlab="", ylab= "Energy sub metering", col= "blue")
      legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), bty="n", lty=1, col=c("black","red","blue"))

    plot(DateTime, feb2007$Global_reactive_power, type="l", lty=1, xlab="datetime", ylab="Global_reactive_power")

dev.off()
