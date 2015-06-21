#Coursera Exploratory data analysis. Project 2.

#Plot 3.

#Justin Peter. 21 June 2015.

#---Clean up the workspace.
    rm(list=ls())

#---Load the ggplot library
    library(ggplot2)

#---Read the data sets.
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")

#---Extract the portion corresponding to Baltimore
    extract <- which(NEI$fips == '24510')
    NEI.Baltimore <- NEI[extract,]

#---Evaluate the total emissions by year
    Balt.yr.tots <- aggregate(Emissions ~ year, data=NEI.Baltimore,sum)


#---Plot using barplot and ggplot2

    png("plot3.png")
    p3 <- ggplot(NEI.Baltimore,aes(x=factor(year),y=Emissions))+
          facet_grid(.~type)+
          geom_bar(stat="identity")+
          labs(x="Year",
               y=expression("Total PM"[2.5]*" emissions (tons)"),
               title=expression("Total PM"[2.5]*" emissions from Baltimore City"))
    print(p3)

    dev.off()

