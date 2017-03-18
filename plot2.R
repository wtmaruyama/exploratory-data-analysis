NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data <- NEI[NEI$fips == "24510",]

data_agg <- aggregate(Emissions~year, data, sum)

png(filename="plot2.png")

barplot(data_agg$Emissions, names.arg=data_agg$year, 
        main="Total Emission in the Baltimore City",
        xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')),
        col = "Blue")

dev.off()
