setwd("/Users/sailinnthu/R/Module4/exdata-data-NEI_data/")

NEIdata <-readRDS("/Users/sailinnthu/R/Module4/exdata-data-NEI_data/summarySCC_PM25.rds")
SCCdata <-readRDS("/Users/sailinnthu/R/Module4/exdata-data-NEI_data/Source_Classification_Code.rds")

subset <- NEIdata[NEIdata$fips == "24510", ]

install.packages('ggplot2')
library(ggplot2)

par("mar"=c(5.1,4.5,4.1,2.1))

png(filename="/Users/sailinnthu/R/Module4/exdata-data-NEI_data/plot3.png", width =480, height = 480, units ="px")

g <- ggplot(subset, aes(year, Emissions, color = type))

g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Total Emissions in Baltimore City from 1999 to 2008")

dev.off()

