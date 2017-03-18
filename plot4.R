library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Coal combustion related sources
coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

data <- merge(x=NEI, y=coal, by='SCC')
data_agg <- aggregate(Emissions~year,data, sum)

png(filename="plot4.png")

ggplot(data_agg, aes(x=year, y=Emissions)) + 
  geom_line(aes(group=1, col=Emissions)) + 
  geom_point(aes(col=Emissions)) + 
  theme(legend.position='none') +
  geom_text(aes(label=round(Emissions,3), size=1, hjust=0, vjust=-0.3))+
  ggtitle(expression('Total Emissions of PM'[2.5])) 
 
dev.off()