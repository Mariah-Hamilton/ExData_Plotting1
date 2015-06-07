electric <-read.table("household_power_consumption.txt", header = TRUE, sep = ";", as.is=T, na.string="?")
electric$Global_active_power <-as.numeric(electric$Global_active_power)
electric$Date <-as.Date(electric$Date, format = "%d/%m/%Y")
feb2007 <-electric[electric$Date >= "2007-02-01" & electric$Date <="2007-02-02",]
rm(electric)
x <-paste(feb2007$Date, feb2007$Time)
DateTime <-strptime(x, "%Y-%m-%d %H:%M:%S")

png("plot2.png", height = 480, width = 480)
plot(DateTime, feb2007$Global_active_power, type="l", lty=1, xlab="", ylab="Global active power (kilowatts)")
dev.off()
