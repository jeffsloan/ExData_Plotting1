# Weirdly enough, I get much a better panel plot by using R in the Terminal than
# when I use R in R Studio. The graph I attach in my Github repo is from using R in
# the Terminal.

setwd("./exdata-data-household_power_consumption")
data <- read.table("./household_power_consumption.txt", header = T, sep =";", nrows=70000)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
ourdata <- data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]
ourdata$DateTime<-with(ourdata, paste(Date, Time))
ourdata$DateTime <- as.POSIXct(ourdata$DateTime)
ourdata$Global_active_power <- as.numeric(as.character(ourdata$Global_active_power))
ourdata$Voltage <- as.numeric(as.character(ourdata$Voltage))
ourdata$Sub_metering_1 <- as.numeric(as.character(ourdata$Sub_metering_1))
ourdata$Sub_metering_2 <- as.numeric(as.character(ourdata$Sub_metering_2))
ourdata$Sub_metering_3 <- as.numeric(as.character(ourdata$Sub_metering_3))
ourdata$Global_reactive_power <- as.numeric(as.character(ourdata$Global_reactive_power))

par(mfrow = c(2,2))

#plot 1
with(ourdata, plot(DateTime, ourdata$Global_active_power, type = "l",
                   ylab = "Global Active Power", xlab=""))

#plot 2
with(ourdata, plot(DateTime, ourdata$Voltage, type = "l",
                   ylab = "Voltage", xlab = "datetime"))

#plot 3
with(ourdata, plot(DateTime, ourdata$Sub_metering_1,
                   type = "l", ylab = "Energy sub metering", xlab = ""))
with(ourdata, lines(DateTime, ourdata$Sub_metering_2,
                    type = "l", ylab = "Energy sub metering", xlab = "",
                    col = 2))
with(ourdata, lines(DateTime, ourdata$Sub_metering_3,
                    type = "l", ylab = "Energy sub metering", xlab = "",
                    col=4))
legend(x= "topright", y = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c(1,2,4), lty=1, bty = "n")

# plot 4
with(ourdata, plot(DateTime, Global_reactive_power, type = "l", xlab="datetime"))

#save plot
dev.copy(png, "plot4.png")
dev.off()
