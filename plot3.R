library(ggplot2)

# setwd("/Volumes/ybr/experiments/exdata-016")

NEI <- readRDS("summarySCC_PM25.rds")

baltimoreNEI <- NEI[NEI$fips == "24510",]


emPerYearPoint <- aggregate(Emissions ~ year, sum, data = baltimoreNEI[baltimoreNEI$type == "POINT",])
emPerYearPoint$type <- "POINT"

emPerYearNonPoint <- aggregate(Emissions ~ year, sum, data = baltimoreNEI[baltimoreNEI$type == "NONPOINT",])
emPerYearNonPoint$type <- "NONPOINT"

emPerYearNonRoad <- aggregate(Emissions ~ year, sum, data = baltimoreNEI[baltimoreNEI$type == "NON-ROAD",])
emPerYearNonRoad$type <- "NON-ROAD"

emPerYearOnRoad <- aggregate(Emissions ~ year, sum, data = baltimoreNEI[baltimoreNEI$type == "ON-ROAD",])
emPerYearOnRoad$type <- "ON-ROAD"

all <- rbind(emPerYearNonPoint, emPerYearNonRoad, emPerYearOnRoad, emPerYearPoint)

png("plot3.png")
qplot(year, Emissions, data = all, color = type, geom = c("line"))
dev.off()
