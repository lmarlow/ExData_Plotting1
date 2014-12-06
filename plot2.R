# Line graph of Global Active Power vs. Time

source('load_power_data.R')

powerData <- loadPowerData(as.Date('2007-02-01'), as.Date('2007-02-02'))

png('plot2.png', height=480, width=480, bg='transparent')
with(powerData, plot(Time, Global_active_power,
                     type='l',
                     xlab='',
                     ylab='Global Active Power (kilowatts)'))
dev.off()

