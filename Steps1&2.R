read.csv("Mall_Customers_extended.csv")

data("Mall_Customers_extended.csv")

Mall_Customers_extended <- read.csv("Mall_Customers_extended.csv")

MCData <- data.frame(Mall_Customers_extended)

names(MCData)

MCData$standardAge <- scale(MCData$Age)

MCData$standardAnnual.Income..k.. <- scale(MCData$Annual.Income..k..)

MCData$standardSpending.Score..1.100. <- scale(MCData$Spending.Score..1.100.)

SubData <- MCData[, c("standardAge", "standardAnnual.Income..k..", "standardSpending.Score..1.100.")]

#install.packages("factoextra")
library(factoextra)

#install.packages("rstatix")
library(rstatix)

fviz_nbclust(SubData, kmeans, method="wss") + geom_vline(xintercept = 0, linetype = 2)

set.seed(123)

km.res <- kmeans(SubData, 4, nstart=25)

ClusterData <- cbind(SubData, cluster = km.res$cluster)

fviz_cluster(km.res,
             data = SubData,
             geom = "point",
             ellipse.type = "convex",
             palette = "jco", # A common color palette
             ggtheme = theme_minimal()
)


