#Installing Packages i need
install.packages("installr")
library(installr)
library(ggplot2)
library(dplyr)
#reading data file using read.csv
MCE_data <- read.csv("Mall_Customers_extended.csv")
names(MCE_data)

# renaming column names to something easier
MCE_data <- MCE_data |>
  rename(
    Annual.Income = Annual.Income..k..,
    Spending.Score = Spending.Score..1.100.
  )

# creating new data set using cbind() function
clustered_data <- cbind(MCE_data, cluster =km.res$cluster)

# Distribution of Age across clusters
Age_boxplot <- ggplot(clustered_data, aes(factor(cluster), Age, fill = factor(cluster))) +
  geom_boxplot() +
  theme_minimal()

Age_boxplot

# Distribution of Annual Income across clusters
Annual_Income_Boxplot <- ggplot(clustered_data, aes(factor(cluster), Annual.Income, fill = factor(cluster))) +
  geom_boxplot() +
  theme_minimal()

Annual_Income_Boxplot

# Distribution of Spending Score across clusters
Spending_Score_Boxplot <- ggplot(clustered_data, aes(factor(cluster), Spending.Score, fill = factor(cluster))) +
  geom_boxplot() +
  theme_minimal()

Spending_Score_Boxplot
