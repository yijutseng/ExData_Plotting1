library(data.table)
library( lattice )
HPC_DT <-fread("~/GitHub/ExData_Plotting1/household_power_consumption.txt", 
               sep=";", stringsAsFactors=FALSE)
HPC_DT2D<-HPC_DT[grepl('^1/2/2007',Date)|grepl('^2/2/2007',Date)]
HPC_DT2D$DateTimeString<-paste(HPC_DT2D$Date,HPC_DT2D$Time)



png(file = "plot4.png", bg = "transparent",width = 480,height = 480)
par(mfrow=c(2,2))

#2
plot(HPC_DT2D[Global_active_power!='?',strptime(HPC_DT2D$DateTimeString,format="%d/%m/%Y %H:%M:%S")],
     HPC_DT2D[Global_active_power!='?',as.numeric(Global_active_power)], type="n",
     xlab='',ylab='Global Active Power (kilowatts)',main = '')
lines(HPC_DT2D[Global_active_power!='?',strptime(HPC_DT2D$DateTimeString,format="%d/%m/%Y %H:%M:%S")],
      HPC_DT2D[Global_active_power!='?',as.numeric(Global_active_power)])
#New
plot(HPC_DT2D[Voltage!='?',strptime(HPC_DT2D$DateTimeString,format="%d/%m/%Y %H:%M:%S")],
     HPC_DT2D[Voltage!='?',as.numeric(Voltage)], type="n",
     xlab='datetime',ylab='Voltage',main = '')
lines(HPC_DT2D[Voltage!='?',strptime(HPC_DT2D$DateTimeString,format="%d/%m/%Y %H:%M:%S")],
      HPC_DT2D[Voltage!='?',as.numeric(Voltage)])
#3
plot(HPC_DT2D[Sub_metering_1!='?',strptime(HPC_DT2D$DateTimeString,format="%d/%m/%Y %H:%M:%S")],
     HPC_DT2D[Sub_metering_1!='?',as.numeric(Sub_metering_1)], type="n",
     xlab='',ylab='Energy sub metering',main = '')
lines(HPC_DT2D[Sub_metering_1!='?',strptime(HPC_DT2D$DateTimeString,format="%d/%m/%Y %H:%M:%S")],
      HPC_DT2D[Sub_metering_1!='?',as.numeric(Sub_metering_1)])
lines(HPC_DT2D[Sub_metering_2!='?',strptime(HPC_DT2D$DateTimeString,format="%d/%m/%Y %H:%M:%S")],
      HPC_DT2D[Sub_metering_2!='?',as.numeric(Sub_metering_2)],col='red')
lines(HPC_DT2D[Sub_metering_3!='?',strptime(HPC_DT2D$DateTimeString,format="%d/%m/%Y %H:%M:%S")],
      HPC_DT2D[Sub_metering_3!='?',as.numeric(Sub_metering_3)],col='blue')
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3') , 
       lty=1, col=c('black', 'red', 'blue'), cex=.75)
#4
plot(HPC_DT2D[Global_reactive_power!='?',strptime(HPC_DT2D$DateTimeString,format="%d/%m/%Y %H:%M:%S")],
     HPC_DT2D[Global_reactive_power!='?',as.numeric(Global_reactive_power)], type="n",
     xlab='datetime',ylab='Global Reactive Power',main = '')
lines(HPC_DT2D[Global_reactive_power!='?',strptime(HPC_DT2D$DateTimeString,format="%d/%m/%Y %H:%M:%S")],
      HPC_DT2D[Global_reactive_power!='?',as.numeric(Global_reactive_power)])
dev.off()