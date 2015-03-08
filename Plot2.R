a<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

#Reading the releavnet data for 2 days into a dataframe

b<-a[as.Date(a$Date,"%d/%m/%Y")=="2007-02-01" | as.Date(a$Date,"%d/%m/%Y")=="2007-02-02",]
b$Date<-as.Date(b$Date,"%d/%m/%Y")
b$Day<-weekdays(b$Date)
b$date_time<-paste(b$Date,b$Time,sep=" ")
b$date_time<-strptime(b$date_time,"%Y-%m-%d %H:%M:%S")

#Plot2

par(mfrow = c(1,1))
plot(b$date_time,as.numeric(b$Global_active_power),type="l",ylab="Global Active Power
     (kilowatts)",xlab="")
dev.copy(png, file = "Plot2.png");dev.off() 


dev.copy(png, file = "Plot4.png");dev.off() 
