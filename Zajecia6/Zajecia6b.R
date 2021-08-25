library(mlbench)
library(e1071)

data("Vehicle")
x<-Vehicle[,-19]

colnames(x) <- k("x", "y")
k<-kmeans(x,4)
print(k)
plot(x,col=k$cluster)

k$cluster
k$size