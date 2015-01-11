setwd("./exdata-data-household_power_consumption")
data <- read.table("./household_power_consumption.txt", header = T, sep =";", nrows=70000)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
ourdata <- data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]
ourdata$DateTime<-with(ourdata, paste(Date, Time))
ourdata$DateTime <- as.POSIXct(ourdata$DateTime)
ourdata$Sub_metering_1 <- as.numeric(as.character(ourdata$Sub_metering_1))
ourdata$Sub_metering_2 <- as.numeric(as.character(ourdata$Sub_metering_2))
ourdata$Sub_metering_3 <- as.numeric(as.character(ourdata$Sub_metering_3))

with(ourdata, plot(DateTime, ourdata$Sub_metering_1,
                   type = "l", ylab = "Energy sub metering", xlab = ""))
with(ourdata, lines(DateTime, ourdata$Sub_metering_2,
                    type = "l", ylab = "Energy sub metering", xlab = "",
                    col = 2))
with(ourdata, lines(DateTime, ourdata$Sub_metering_3,
                    type = "l", ylab = "Energy sub metering", xlab = "",
                    col=4))
legend(x= "topright", y = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c(1,2,4), lty=1)
#save graph as png
dev.copy(png, "plot3.png")
dev.off()