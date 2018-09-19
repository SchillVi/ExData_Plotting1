## Plot 3 ##

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
png(filename = "plot3.png")

# make plot
with(hpc, plot(Datetime, Sub_metering_1, type = "n",  xlab = "", ylab = ""))
with(hpc, lines(Datetime, Sub_metering_1, col = "black"))
with(hpc, lines(Datetime, Sub_metering_2, col = "red"))
with(hpc, lines(Datetime, Sub_metering_3, col = "blue"))

# add legend
legend(x = "topright", col = c("blue", "red", "black"), lty=c(1,1,1), cex = 0.8,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# add y axis label
mtext(text = "Energy sub metering", side = 2, line = 2.5)


# close the file device
dev.off()

