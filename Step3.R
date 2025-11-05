#Installing Packages i need
install.packages("installr")
library(installr)
library(ggplot2)

#reading data file using read.csv
MCE_data <- read.csv("Mall_Customers_extended.csv")

# creating new dataset using cbind() function
clustered_data <- cbind(MCE_data, cluster =km.res$cluster)

ggplot(clustered_data, aes(factor(cluster), Age, fill = factor(cluster))) +
  geom_boxplot() +
  theme_minimal()
