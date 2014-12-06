# Line graph of Sub-metering vs. Time

source('load_power_data.R')

powerData <- loadPowerData(as.Date('2007-02-01'), as.Date('2007-02-02'))

png('plot3.png', height=480, width=480, bg='transparent')
with(powerData, {
  plot(Time, Sub_metering_1,
       type='n',
       ylab='Energy sub metering', xlab='')
  points(Time, Sub_metering_1,
         type='l', col='black')
  points(Time, Sub_metering_2,
         type='l', col='red')
  points(Time, Sub_metering_3,
         type='l', col='blue')
  legend("topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
         lty=c(1,1,1), col=c('black', 'red', 'blue'))
})
dev.off()


