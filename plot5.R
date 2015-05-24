setwd("/Users/sailinnthu/R/Module4/exdata-data-NEI_data/")

NEIdata <-readRDS("/Users/sailinnthu/R/Module4/exdata-data-NEI_data/summarySCC_PM25.rds")
SCCdata <-readRDS("/Users/sailinnthu/R/Module4/exdata-data-NEI_data/Source_Classification_Code.rds")

head(SCCdata$Short.Name)

subset <- NEIdata[NEIdata$fips == "24510", ]

par("mar"=c(5.1,4.5,4.1,2.1))

png(filename="/Users/sailinnthu/R/Module4/exdata-data-NEI_data/plot5.png", width =480, height = 480, units ="px")

motor <- grep("motor", SCCdata$Short.Name, ignore.case = T)
motor <- SCCdata[motor, ]
motor <- subset[subset$SCC %in% motor$SCC, ]
motorEmissions <- aggregate(motor$Emissions, list(motor$year), FUN = "sum")

plot(motorEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions From Motor Vehicle Sources\n from 1999 to 2008 in Baltimore City", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()
