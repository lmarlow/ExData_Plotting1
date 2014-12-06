# Histogram of Global Active Power

source('load_power_data.R')

powerData <- loadPowerData(as.Date('2007-02-01'), as.Date('2007-02-02'))

png('plot1.png', height=480, width=480, bg='transparent', col='red')
hist(powerData$Global_active_power,
     main='Global Active Power',
     xlab='Global Active Power (kilowatts)',
     col='red')
dev.off()
