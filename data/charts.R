library(ggplot2)
library(ggthemes)

data <- read.csv("experiments.csv")

data$Dimensions <- as.factor(data$Dimensions)
data.Rastrigin <- data[ data$Function == "Rastrigin", ]

ggplot(data.Rastrigin, aes(x=Dimensions,y=Fitness,color=Algorithm))+geom_point()
ggplot(data.Rastrigin, aes(x=Dimensions,y=Fitness,fill=Algorithm))+geom_boxplot()


