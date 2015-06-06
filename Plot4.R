## Code for Assignment 1 of Exploratory Data Analysis in R.  A. Brignole 6/2015

## Step 1.  Read in Data

  a<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

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

  NAS<- !is.na(b$Global_active_power)
  d<- b[NAS,]
  
  d$DateTime<- paste(d$Date, d$Time, sep = " ")
  d$DateTime<-as.POSIXlt(d$DateTime)

## Step 3. Graphing Fourplots of GAP, Voltage, Submetering, Global Reactive Power

  png(filename = "Plot4.png", width = 480, height = 480, units = "px")
  
  par(mfrow = c(2,2))
  
  with (d, { 
    plot(d$DateTime, d$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
    plot(d$DateTime, d$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
    plot(d$DateTime, d$Sub_metering_1, type = "l", ylab = "Energy Sub metering")
      lines(d$DateTime, d$Sub_metering_2, col = "red")
      lines(d$DateTime, d$Sub_metering_3, col = "blue")
    
      legend("topright", col = c("black", "red", "blue"), lty = 1 , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(d$DateTime, d$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
    })
  
  dev.off()

