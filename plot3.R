library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data <- NEI[NEI$fips == "24510",]

data_agg <- aggregate(Emissions~year, data, sum)

data$year <- factor(data$year, levels=c('1999', '2002', '2005', '2008'))

png(filename="plot3.png")

ggplot(data, aes(x=year, y=Emissions)) + 
  facet_grid(.~type, scales="free_x", space="free") + 
  geom_bar(stat='identity')
  
dev.off()
