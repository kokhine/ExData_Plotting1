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

# Create Plot 2
png(filename = "plot2.png", width = 480, height = 480)

par (mar = c(5,4,2,2))
with(filteredData, {
  plot(strDate
       ,as.numeric(as.character(filteredData$Global_active_power))
       ,type = "n"
       ,ylab = "Global Active Power (kilowatts)"
       ,xlab = ""
  )
  lines(strDate
        ,as.numeric(as.character(filteredData$Global_active_power))
  )
}
)

dev.off()