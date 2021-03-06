download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","e_cons.zip")
df<-read.csv(unz("e_cons.zip","household_power_consumption.txt"), sep=";")
df1<-df
df1$Date <- as.Date(df1$Date,"%d/%m/%Y")
df2<-subset(df1,Date == "2007-02-01" | Date=="2007-02-02",)
df2$Time <- strptime(paste(df2$Date,df2$Time),format="%Y-%m-%d %H:%M:%S")
head(df2)

png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
hist(as.numeric(as.character(df2$Global_active_power)),col="red",main='Global Active Power',xlab='Global Active Power (Kilowatts)')
dev.off()
