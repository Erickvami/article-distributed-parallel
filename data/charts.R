library(ggplot2)
library(ggthemes)
library(xtable)
library(tidyr)

data <- read.csv("experiments.csv")

means <-  aggregate(Fitness ~ Dimensions + Algorithm + Function, data = data, FUN= "mean" )
sd <-  aggregate(Fitness ~ Dimensions + Algorithm + Function, data = data, FUN= "sd" )
best <-  aggregate(Fitness ~ Dimensions + Algorithm + Function, data = data, FUN= "min" )
stats.0 <-  merge(means,sd,by= c("Dimensions", "Function", "Algorithm"))
stats <- merge(stats.0,best,by= c("Dimensions", "Function", "Algorithm"))
names(stats) <- c("Dimensions", "Function", "Algorithm", "Average","SD","Best")
print(xtable(stats,digits=c(0,0,0,0,-2,-2,-2)), include.rownames=FALSE)

data$Dimensions <- as.factor(data$Dimensions)
data.Rastrigin <- data[ data$Function == "Rastrigin", ]

ggplot(data.Rastrigin, aes(x=Dimensions,y=Fitness,color=Algorithm))+geom_point()
ggplot(data.Rastrigin, aes(x=Dimensions,y=Fitness,fill=Algorithm))+geom_boxplot(notch=TRUE)+scale_y_log10()+theme_tufte()
ggsave("rastrigin-boxplot.png",width=190, units="mm")

data.Sphere <- data[ data$Function == "Sphere", ]

ggplot(data.Sphere, aes(x=Dimensions,y=Fitness,color=Algorithm))+geom_point()+ylim(0,0.05)+theme_tufte()
ggplot(data.Sphere, aes(x=Dimensions,y=Fitness,fill=Algorithm))+geom_boxplot(notch=TRUE)+ylim(0,0.05)+scale_y_log10()+theme_tufte()
ggsave("sphere-boxplot.png",width=190, units="mm")

data.Rosenbrock <- data[ data$Function == "Rosenbrock", ]

ggplot(data.Rosenbrock, aes(x=Dimensions,y=Fitness,color=Algorithm))+geom_point()+theme_tufte()
ggplot(data.Rosenbrock, aes(x=Dimensions,y=Fitness,fill=Algorithm))+geom_boxplot(notch=TRUE)+scale_y_log10()+ theme_tufte()
ggsave("rosenbrock-boxplot.png",width=190, units="mm")
