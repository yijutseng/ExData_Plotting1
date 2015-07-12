library(data.table)
household_power_consumption <-
    read.csv("~/GitHub/ExData_Plotting1/household_power_consumption.txt", 
             sep=";", stringsAsFactors=FALSE)
household_power_consumption$DateNew<-as.Date(household_power_consumption$Date,format="%d/%m/%Y")
HPC_DT<-as.data.table(household_power_consumption)
HPC_DT2D<-HPC_DT[DateNew>=as.Date('2007/02/01', format="%Y/%m/%d")[1]&
                     DateNew<=as.Date('2007/02/02', format="%Y/%m/%d")[1]]
png(file = "plot1.png", bg = "transparent",width = 480,height = 480)
hist(HPC_DT2D[Global_active_power!='?',as.numeric(Global_active_power)],
         main = 'Global Active Power',xlab = 'Global Active Power (kilowatts)',col='red')
dev.off()