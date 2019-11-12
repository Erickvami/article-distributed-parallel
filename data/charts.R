library(ggplot2)
library(ggthemes)

data <- read.csv("experiments.csv")

data$Dimensions <- as.factor(data$Dimensions)
data.Rastrigin <- data[ data$Function == "Rastrigin", ]

ggplot(data.Rastrigin, aes(x=Dimensions,y=Fitness,color=Algorithm))+geom_point()
ggplot(data.Rastrigin, aes(x=Dimensions,y=Fitness,fill=Algorithm))+geom_boxplot(notch=TRUE)+theme_tufte()
ggsave("rastrigin-boxplot.png",width=190, units="mm")

data.Sphere <- data[ data$Function == "Sphere", ]

ggplot(data.Sphere, aes(x=Dimensions,y=Fitness,color=Algorithm))+geom_point()+ylim(0,0.05)+theme_tufte()
ggplot(data.Sphere, aes(x=Dimensions,y=Fitness,fill=Algorithm))+geom_boxplot(notch=TRUE)+ylim(0,0.05)+scale_y_log10()+theme_tufte()
ggsave("sphere-boxplot.png",width=190, units="mm")

data.Rosenbrock <- data[ data$Function == "Rosenbrock", ]

ggplot(data.Rosenbrock, aes(x=Dimensions,y=Fitness,color=Algorithm))+geom_point()+theme_tufte()
ggplot(data.Rosenbrock, aes(x=Dimensions,y=Fitness,fill=Algorithm))+geom_boxplot(notch=TRUE)+scale_y_log10()+ theme_tufte()
ggsave("rosenbrock-boxplot.png",width=190, units="mm")
