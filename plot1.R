NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data <- aggregate(Emissions~year, NEI, sum)

png(filename="plot1.png")

barplot(data$Emissions, names.arg=data$year, 
        main=expression('Total Emission of PM'[2.5]),
        xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')),
        col = "Blue")

dev.off()