setwd("./exdata-data-household_power_consumption")
data <- read.table("./household_power_consumption.txt", header = T, sep =";", nrows=70000)
dates <- as.Date(data$Date, format = "%d/%m/%Y")
data[,1] <- dates
ourdata <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]
ourdata$DateTime<-with(ourdata, paste(Date, Time))
class(ourdata$DateTime)
ourdata$DateTime <- as.POSIXct(ourdata$DateTime)
with(ourdata, plot(DateTime, as.numeric(as.character(ourdata$Global_active_power)),
                   type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
# save line graph as a png
dev.copy(png,'plot2.png')
dev.off()
