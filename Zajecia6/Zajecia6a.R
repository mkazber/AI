library(mlbench)
library(e1071)

data("Vehicle")
x<-Vehicle[,-19]

c<-cmeans(x,4)
print(c)
plot(x,col=c$cluster)

c$cluster
c$size
c$membership