#load file and converts the string ? to NA
data<-read.delim2("C:/Users/crist/Documents/Data Science/Johns Hopkins/Exploratory Data Analysis/exdata_data_household_power_consumption/household_power_consumption.txt",sep=";",na.strings = "?")
#removes NA values from dataframe
data<-na.omit(data)
#convert string to date format
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

#----------------------- Convert dates to character ----------------------------
#Select only the entries between 2007-02-01 and 2007-02-02
data_clean<-data[data$Date>=as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"),]
data_clean$Global_active_power<-as.numeric(data_clean$Global_active_power)
data_clean$Voltage<-as.numeric(data_clean$Voltage)
data_clean$Global_reactive_power<-as.numeric(data_clean$Global_reactive_power)
data_clean$Sub_metering_1<-as.numeric(data_clean$Sub_metering_1)
data_clean$Sub_metering_2<-as.numeric(data_clean$Sub_metering_2)
data_clean$Sub_metering_3<-as.numeric(data_clean$Sub_metering_3)
data_clean$Sub_metering_4<-as.numeric(data_clean$Sub_metering_4)
#---------------------------- Merge Date-Time ----------------------------------
#Merge date and time columns in an new column called date_time
data_clean$date_time<-as.POSIXct(paste(data_clean$Date, data_clean$Time), format="%Y-%m-%d %H:%M:%S")
#---------------------------------graph 4 --------------------------------------
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(data_clean$date_time,data_clean$Global_active_power,type="l",main="",
     xlab="", ylab="Global Active Power")
plot(data_clean$date_time,data_clean$Voltage,type="l",main="",
     xlab="datetime", ylab="Voltage")
plot(data_clean$date_time,data_clean$Sub_metering_1,type="l",main="",
     xlab="", ylab="Energy sub metering")
lines(data_clean$date_time,data_clean$Sub_metering_2,type="l",main="",
      xlab="", ylab="Energy sub metering",col="Red")
lines(data_clean$date_time,data_clean$Sub_metering_3,type="l",main="",
      xlab="", ylab="Energy sub metering",col="Blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black","red", "blue"), bty = "n", lty=1, cex=0.9)
plot(data_clean$date_time,data_clean$Global_reactive_power,type="l",main="",xlab="datetime", 
     ylab="Global_rective_power")
dev.off()