setwd("./exdata-data-household_power_consumption")
data <- read.table("./household_power_consumption.txt", header = T, sep =";")
dates <- as.Date(data$Date, format = "%d/%m/%Y")
data[,1] <- dates
ourdata <- data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]
# factors are being a pain, but this does the trick of getting and graphing the data we want!
hist(as.numeric(as.character(ourdata$Global_active_power)), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = 2)
# save histogram as a png
dev.copy(png,'plot1.png')
dev.off()