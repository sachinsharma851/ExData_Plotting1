a<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

#Reading the releavnet data for 2 days into a dataframe

b<-a[as.Date(a$Date,"%d/%m/%Y")=="2007-02-01" | as.Date(a$Date,"%d/%m/%Y")=="2007-02-02",]
b$Date<-as.Date(b$Date,"%d/%m/%Y")
b$Day<-weekdays(b$Date)
b$date_time<-paste(b$Date,b$Time,sep=" ")
b$date_time<-strptime(b$date_time,"%Y-%m-%d %H:%M:%S")

#Plot3

par(mfrow = c(1,1))
plot(b$date_time,as.numeric(b$Sub_metering_1),type="l",ylab="Energy sub Metering",xlab="")
lines(b$date_time,as.numeric(b$Sub_metering_2),col="Red")
lines(b$date_time,as.numeric(b$Sub_metering_3),col="Blue")
dev.copy(png, file = "Plot3.png");dev.off() 

