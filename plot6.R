library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# Baltimore City or Los Angeles County,  &  motor vehicle sources 
onroad1 <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",]
onroad2 <- NEI[NEI$fips == "06037" & NEI$type == "ON-ROAD",]

data_agg1 <- aggregate(Emissions~year,onroad1, sum)
data_agg2 <- aggregate(Emissions~year,onroad2, sum)
data_agg1$city <- rep("Baltimore City", dim(data_agg1)[1])
data_agg2$city <- rep("Los Angeles", dim(data_agg2)[1])
data_agg <- rbind(data_agg1,data_agg2)

png(filename="plot6.png")

ggplot(data_agg, aes(x=year, y=Emissions)) + 
  geom_bar(aes(fill=year),stat="identity") + 
  facet_grid(.~city, scales="free_x", space="free") +
  guides(fill=F) + 
  ggtitle('Total Emissions of Motor Vehicle Sources\nLos Angeles County, California vs. Baltimore City, Maryland') + 
  ylab(expression('PM'[2.5])) + 
  xlab('Year') + 
  theme(legend.position='none') + 
  geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=-1))

dev.off()
