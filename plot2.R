setwd("/Users/sailinnthu/R/Module4/exdata-data-NEI_data/")

NEIdata <-readRDS("/Users/sailinnthu/R/Module4/exdata-data-NEI_data/summarySCC_PM25.rds")
SCCdata <-readRDS("/Users/sailinnthu/R/Module4/exdata-data-NEI_data/Source_Classification_Code.rds")

par("mar"=c(5.1,4.5,4.1,2.1))

png(filename="/Users/sailinnthu/R/Module4/exdata-data-NEI_data/plot2.png", width =480, height = 480, units ="px")

totalEmissions <- aggregate(subset$Emissions, list(subset$year), FUN = "sum")

plot(totalEmissions, type="l",xlab="Year", main = "Total Emissions in the Baltimore City, Maryland from 1999 to 2008",ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()
