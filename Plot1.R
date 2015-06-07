electric <-read.table("household_power_consumption.txt", header = TRUE, sep = ";", as.is=T, na.string="?")
electric$Global_active_power <-as.numeric(electric$Global_active_power)
electric$Date <-as.Date(electric$Date, format = "%d/%m/%Y")
feb2007 <-electric[electric$Date >= "2007-02-01" & electric$Date <="2007-02-02",]
rm(electric)

png("plot1.png", height = 480, width = 480)
hist(feb2007$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global active power(kilowatts)", xlim = c(0,6), ylim = c(0,1200), xaxp = c(0,6,3))
dev.off()
