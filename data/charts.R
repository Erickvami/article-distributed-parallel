library(ggplot2)
library(ggthemes)

data <- read.csv("experiments.csv")

data.Rastrigin <- data[ data$Function == "Rastrigin", ]

