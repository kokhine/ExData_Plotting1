#Set working directory
setwd("~/Coursera/Exploratory Data Analysis/Assignment 1/exdata-data-household_power_consumption")

#Read and structure data
data <- read.csv("household_power_consumption.txt", header = T, sep = ";")
data <- within (data
                , strDate <-strptime(paste(data$Date, data$Time, sep = " ")
                                     , "%d/%m/%Y %H:%M:%S"
                )
)

filteredData <- data[data$strDate >= "2007-02-01" & data$strDate < "2007-02-03",]

# Create Plot 3
png(filename = "plot3.png", width = 480, height = 480)

par (mar = c(5,4,2,2))
with(filteredData, {
  plot(strDate
       ,as.numeric(as.character(Sub_metering_1))
       ,type = "n"
       ,ylab = "Energy sub metering"
       ,xlab = ""
  )
  lines(strDate, as.numeric(as.character(Sub_metering_1)), col = "black")
  lines(strDate, as.numeric(as.character(Sub_metering_2)), col = "red")
  lines(strDate, as.numeric(as.character(Sub_metering_3)), col = "blue")
  legend("topright", lty = c(1,1)
         , col = c("black", "red", "blue")
         , legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )
}
)

dev.off()
