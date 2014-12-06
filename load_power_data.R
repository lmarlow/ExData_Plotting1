# Load the household power data into a data frame
# fetches and unzips the file if necessary
loadPowerData <- function(since=NA, before=NA) {
  # get the data
  fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  zipFile <- basename(fileUrl)
  if (!file.exists(zipFile)) {
    download.file(fileUrl, destfile=zipFile, method='curl')
    downloadDate <- date()
    downloadDate  
  }
  
  dataFile <- 'household_power_consumption.txt'
  if (!file.exists(dataFile)) {
    unzip(zipFile)
  }
  
  data <- read.csv(dataFile, sep=';', na.strings='?')
  data$Date <- as.Date(data$Date, format='%d/%m/%Y')
  data <- if (!(is.na(since) & is.na(before))) {
    data[data$Date >= since & data$Date <= before, ]
  } else if (!is.na(since)) {
    data[data$Date >= since, ]  
  } else if (!is.na(since)) {
    data[data$Date <= before, ]
  } else {
    data
  }
  data$Time <- strptime(paste(data$Date, data$Time), format='%Y-%m-%d %H:%M:%S')
  data
}