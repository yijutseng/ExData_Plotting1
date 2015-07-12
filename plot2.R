library(data.table)
library( lattice )
HPC_DT <-fread("~/GitHub/ExData_Plotting1/household_power_consumption.txt", 
               sep=";", stringsAsFactors=FALSE)
HPC_DT2D<-HPC_DT[grepl('^1/2/2007',Date)|grepl('^2/2/2007',Date)]
HPC_DT2D$DateTimeString<-paste(HPC_DT2D$Date,HPC_DT2D$Time)



png(file = "plot2.png", bg = "transparent",width = 480,height = 480)
plot(HPC_DT2D[Global_active_power!='?',strptime(HPC_DT2D$DateTimeString,format="%d/%m/%Y %H:%M:%S")],
     HPC_DT2D[Global_active_power!='?',as.numeric(Global_active_power)], type="n",
     xlab='',ylab='Global Active Power (kilowatts)',main = '')
lines(HPC_DT2D[Global_active_power!='?',strptime(HPC_DT2D$DateTimeString,format="%d/%m/%Y %H:%M:%S")],
      HPC_DT2D[Global_active_power!='?',as.numeric(Global_active_power)])

dev.off()