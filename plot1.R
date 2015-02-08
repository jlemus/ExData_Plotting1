Date1 <- strptime("2006/12/16 17:24:00", "%Y/%m/%d %H:%M:%S")
Date2 <- strptime("2007/02/01 00:00:00", "%Y/%m/%d %H:%M:%S")

delta_mins <- abs(as.numeric(difftime(Date1, Date2, units = "mins")))

con <- file("/Users/TaxiMagic/Courses/exploratory data analysis/course project 1/data/household_power_consumption.txt")

open(con)

data <- read.table(con, sep = ";", header = TRUE, nrows = 24*60*2, skip = delta_mins)

head(data)
tail(data)

close(con)

con2 <- file("/Users/TaxiMagic/Courses/exploratory data analysis/course project 1/data/household_power_consumption.txt")
open(con2)
        
names <- read.table(con2, sep = ";", header = TRUE, nrows = 1)
names <- colnames(names)
colnames(data) <- names

hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     col = "red", main = "Global Active Power")

dev.copy(png, file = "plot1.png")
dev.off()

