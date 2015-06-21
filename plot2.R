#Coursera Exploratory data analysis. Project 2.

#Plot 2.

#Justin Peter. 21 June 2015.

#---Clean up the workspace.
    rm(list=ls())

#---Read the data sets.
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")

#---Extract the portion corresponding to Baltimore
    extract <- which(NEI$fips == '24510')
    NEI.Baltimore <- NEI[extract,]

#---Evaluate the total emissions by year
    Balt.yr.tots <- aggregate(Emissions ~ year, data=NEI.Baltimore,sum)

#---Plot using barplot. More intuitive than a line plot

    png("plot2.png")
    barplot(Balt.yr.tots$Emissions,names.arg=Balt.yr.tots$year,
            xlab="Year",
            ylab=expression("Total PM"[2.5]*" emissions (tons)"),
            main=expression("Total PM"[2.5]*" emissions from Baltimore City"))
    dev.off()

