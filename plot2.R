## Plot 2 ##

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
png(filename = "plot2.png")

# generate the plot
plot(hpc$Datetime, hpc$Global_active_power, type = "l", xlab = "", ylab = "")

# add axis labels
mtext(text = "Global Active Power (kilowatts)", side = 2, line = 2.5)

# close the file device
dev.off()

