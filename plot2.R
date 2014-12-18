setwd("/Volumes/ybr/experiments/exdata-016")

NEI <- readRDS("summarySCC_PM25.rds")

baltimoreNEI <- NEI[NEI$fips == "24510",]

emPerYear <- aggregate(Emissions ~ year, sum, data = baltimoreNEI)

png("plot2.png")
plot(emPerYear, type = "l")
dev.off()
