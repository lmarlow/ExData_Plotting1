# Show 4 plots in a 2x2 configuration

source('load_power_data.R')

powerData <- loadPowerData(as.Date('2007-02-01'), as.Date('2007-02-02'))

png('plot4.png', height=480, width=480, bg='transparent')
par(mfcol=c(2,2))
with(powerData, {
  plot(datetime, Global_active_power,
       type='l',
       xlab='',
       ylab='Global Active Power')

  plot(datetime, Sub_metering_1,
       type='n',
       ylab='Energy sub metering', xlab='')
  points(datetime, Sub_metering_1,
         type='l', col='black')
  points(datetime, Sub_metering_2,
         type='l', col='red')
  points(datetime, Sub_metering_3,
         type='l', col='blue')
  legend("topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
         lty=c(1,1,1), col=c('black', 'red', 'blue'), bty='n')
  
  plot(datetime, Voltage,
       type='l')

  plot(datetime, Global_reactive_power,
       type='l')
  
})
dev.off()


