## Code for Plot 1 of Assignment 1 - Exploratory Data Analysis in R.  A. Brignole 6/2015

## Step 1.  Read in Data

  temp<- tempfile()
  fileurl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileurl,temp)

  a<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

  unlink(temp)
  
## Step 2. Format Columns and Subset Data

  a$Date <- as.Date(a$Date, "%d/%m/%Y")
  
  b1<- subset(a, Date == "2007-02-01")
  b2<- subset(a, Date == "2007-02-02")
  b<- rbind(b1, b2)
  
  b$Global_active_power<-as.numeric(b$Global_active_power)
  b$Global_reactive_power<-as.numeric(b$Global_reactive_power)
  b$Voltage <- as.numeric(b$Voltage)
  b$Sub_metering_1 <- as.numeric(b$Sub_metering_1)
  b$Sub_metering_2 <- as.numeric(b$Sub_metering_2)
  b$Sub_metering_3 <- as.numeric(b$Sub_metering_3)

## Step 3. Create the First Plot - Histogram of Global Active Power

  NAS<- !is.na(b$Global_active_power)
  d<- b[NAS,]
  
  png(filename = "Plot1.png", width = 480, height = 480, units = "px")
  
  hist(d$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilograms)")
  
  dev.off()
