library(class)
library(tree)
library(mlbench)
library(e1071)

data(Vehicle)
l.obs <- nrow(Vehicle)
tmp <-sample(1:l.obs,round(l.obs/3),replace = FALSE)
V.train <- Vehicle[-tmp,]
V.test <- Vehicle[tmp,]
tree.train <-tree(Class ~.,V.train)
plot(tree.train)
text(tree.train)
result <-predict(tree.train,V.train[-19],type = 'class')
klasa<-V.test$Class
blad<-1-sum(result==klasa)/length(klasa)


