## Plot 1 ##


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
png(filename = "plot1.png")

# generate the histogram
hist(hpc$Global_active_power,# freq = TRUE, 
     xlab = " ", 
     ylab = " ", 
     col = "red", 
     main = "Global Active Power", 
     xlim = c(0, 7), 
     axes = FALSE)
# add the x and y axis
axis(side = 1, at = seq(0, 6, by = 2))
axis(side = 2, at = seq(0, 1200, by = 200))
# change the font size
par(ps = 8, mar = c(5.1, 4.1, 4.1, 2.1))
# add axis labels
mtext(text = "Global Active Power (kilowatts)", side = 1, line = 2.5)
mtext(text = "Frequency", side = 2, line = 2.5)

# close the file device
dev.off()

