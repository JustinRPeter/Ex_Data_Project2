#Coursera Exploratory data analysis. Project 2.

#Plot 1

#Justin Peter. 21 June 2015.

#---Clean up the workspace.
    rm(list=ls())

#---Read the data sets.
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")

#---Evaluate the total emissions by year
    yr.tots <- aggregate(Emissions ~ year, data=NEI,sum)

#---Plot using barplot. More intuitive than a line plot

    png("plot1.png")
    barplot(yr.tots$Emissions/1.e06,names.arg=yr.tots$year,
            xlab="Year",
            ylab=expression("Total PM"[2.5]*" emissions (millions of tons)"),
            main=expression("Total PM"[2.5]*" emissions from all sources"))
    dev.off()

