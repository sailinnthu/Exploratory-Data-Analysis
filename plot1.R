setwd("/Users/sailinnthu/R/Module4/exdata-data-NEI_data/")

NEIdata <-readRDS("/Users/sailinnthu/R/Module4/exdata-data-NEI_data/summarySCC_PM25.rds")
SCCdata <-readRDS("/Users/sailinnthu/R/Module4/exdata-data-NEI_data/Source_Classification_Code.rds")

head(NEIdata)
head(SCCdata)
dim(NEIdata)
dim(SCCdata)

par("mar"=c(5.1,4.5,4.1,2.1))

png(filename="/Users/sailinnthu/R/Module4/exdata-data-NEI_data/plot1.png", width =480, height = 480, units ="px")

totalEmissions <- aggregate(NEIdata$Emissions, list(NEIdata$year), FUN ="sum")

plot(totalEmissions, type="l",xlab="Year", main = "Total Emissions in the United States from 1999 to 2008",ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()
