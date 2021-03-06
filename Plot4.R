download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","e_cons.zip")
df<-read.csv(unz("e_cons.zip","household_power_consumption.txt"), sep=";")
df1<-df
df1$Date <- as.Date(df1$Date,"%d/%m/%Y")
df2<-subset(df1,Date == "2007-02-01" | Date=="2007-02-02",)
df2$Time <- strptime(paste(df2$Date,df2$Time),format="%Y-%m-%d %H:%M:%S")
head(df2)


png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12,bg = "white")
par(mfrow=c(2,2))
plot(df2$Time,as.numeric(as.character(df2$Global_active_power)),type="n", xlab="", ylab = "Global Active Power", cex.lab = 0.80)
lines(df2$Time,as.numeric(as.character(df2$Global_active_power)),type="l", col="black")

plot(df2$Time,as.numeric(as.character(df2$Voltage)),type="n", xlab="datetime", ylab = "Voltage", cex.lab = 0.80)
lines(df2$Time,as.numeric(as.character(df2$Voltage)),type="l", col="black")

plot(df2$Time,as.numeric(as.character(df2$Sub_metering_1)),type="n", xlab="", ylab = "Energy Sub Metering", cex.lab = 0.80)
lines(df2$Time,as.numeric(as.character(df2$Sub_metering_1)),type="l", col="black")
lines(df2$Time,as.numeric(as.character(df2$Sub_metering_2)),type="l", col="red")
lines(df2$Time,as.numeric(as.character(df2$Sub_metering_3)),type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , 
       lty=1, col=c('black', 'red', 'blue'),cex = 0.80,bty="n", merge = TRUE)

plot(df2$Time,as.numeric(as.character(df2$Global_reactive_power)),type="n", xlab="datetime", ylab="Global_reactive_power", cex.lab = 0.80)
lines(df2$Time,as.numeric(as.character(df2$Global_reactive_power)),type="l", col="black")



dev.off()
