setwd("/Volumes/ybr/experiments/exdata-016")

NEI <- readRDS("summarySCC_PM25.rds")

emPerYear <- aggregate(Emissions ~ year, sum, data = NEI)

png("plot1.png")
plot(emPerYear, type = "l")
dev.off()
