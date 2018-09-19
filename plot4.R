## Plot 4 ##

# read in the data
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# generate datetime as a merge of the "Date" and "Time" variable
hpc$Datetime <- paste(hpc$Date, hpc$Time, sep = " ")
hpc$Datetime <- strptime(hpc$Datetime, format = "%d/%m/%Y %H:%M:%S")

# only use 2007-02-01 until 2007-02-02
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc <- subset(hpc, (Date >= "2007-02-01" & Date <= "2007-02-02"))

########################
# open the file device
png(filename = "plot4.png")

# 4 graphs in one
par(mfrow = c(2,2))

### Plot topleft (aka plot2)

plot(hpc$Datetime, hpc$Global_active_power, type = "l", xlab = "", ylab = "")
mtext(text = "Global Active Power", side = 2, line = 2.5, cex = 0.8)

### Plot topright
plot(hpc$Datetime, hpc$Voltage, type = "l", xlab = "", ylab = "")
mtext(text = "Voltage", side = 2, line = 2.5, cex = 0.8)
mtext(text = "datetime", side = 1, line = 2.5, cex = 0.8)

### Plot bottomleft (aka plot3)

with(hpc, plot(Datetime, Sub_metering_1, type = "n",  xlab = "", ylab = ""))
with(hpc, lines(Datetime, Sub_metering_1, col = "black"))
with(hpc, lines(Datetime, Sub_metering_2, col = "red"))
with(hpc, lines(Datetime, Sub_metering_3, col = "blue"))
legend(x = "topright", col = c("blue", "red", "black"), lty=c(1,1,1), cex = 0.8,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
mtext(text = "Energy sub metering", side = 2, line = 2.5, cex = 0.8)

### Plot bottomright
plot(hpc$Datetime, hpc$Global_reactive_power, type = "l", xlab = "", ylab = "")
mtext(text = "Global_reactive_power", side = 2, line = 2.5, cex = 0.8)
mtext(text = "datetime", side = 1, line = 2.5, cex = 0.8)

# close the file device
dev.off()

