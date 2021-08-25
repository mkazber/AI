library(mlbench)
library(e1071)

data(Vehicle)
x<-Vehicle[,-19]

h<-hclust(dist(x))
tmp<-cutree(h,k=8)
plot(h)

tab<-Vehicle[,19]
table(tab,tmp)