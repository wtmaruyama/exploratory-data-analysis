library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# Baltimore City &  motor vehicle sources 
onroad <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",]

data_agg <- aggregate(Emissions~year,onroad, sum)

png(filename="plot5.png")

ggplot(data_agg, aes(x=year, y=Emissions)) + 
  geom_bar(aes(fill=year),stat="identity") + 
  guides(fill=F) + 
  ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City') + 
  ylab(expression('PM'[2.5])) + 
  xlab('Year') + 
  theme(legend.position='none') + 
  geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=2))

dev.off()