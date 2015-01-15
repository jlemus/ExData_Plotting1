Date1 <- strptime("2006/12/16 17:24:00", "%Y/%m/%d %H:%M:%S")
Date2 <- strptime("2007/02/01 00:00:00", "%Y/%m/%d %H:%M:%S")

delta_hours <- abs(as.numeric(difftime(Date1, Date2, units = "mins")))

con <- file("/Users/TaxiMagic/Courses/exploratory data analysis/course project 1/data/household_power_consumption.txt")

open(con)

data <- read.table(con, sep = ";", header = TRUE, nrows = 24*60*2, skip = delta_hours)

head(data)
tail(data)

close(con)

con2 <- file("/Users/TaxiMagic/Courses/exploratory data analysis/course project 1/data/household_power_consumption.txt")
open(con2)

names <- read.table(con2, sep = ";", header = TRUE, nrows = 1)
names <- colnames(names)
colnames(data) <- names

data$Date <- as.Date(data$Date, "%d/%m/%Y")

datetime <- paste(data$Date, data$Time, sep = " ")

datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S")

weekdays <- weekdays(datetime)

dataplot3 <- data.frame(datetime, weekdays, data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3)

plot(dataplot3$datetime, dataplot3$data.Sub_metering_1, type = "o", 
                 ylab = "Global Active Power (kilowatts)", pch = "")

points(dataplot3$datetime, dataplot3$data.Sub_metering_2, type = "o", 
                 ylab = "Global Active Power (kilowatts)", pch = "", col = "red")

points(dataplot3$datetime, dataplot3$data.Sub_metering_3, type = "o", 
       ylab = "Global Active Power (kilowatts)", pch = "", col = "blue")

legend(dataplot3$datetime, y = c(dataplot3$data.Sub_metering_1, dataplot3$data.Sub_metering_2, dataplot3$data.Sub_metering_3))
