library(class)
library(e1071)
library(mlbench)

data(Vehicle)
l.obs <- nrow(Vehicle)

tmp <-sample(1:l.obs,round(l.obs/3),replace = FALSE)
V.train <- Vehicle[tmp,]
V.test <- Vehicle[tmp,]

cB <- naiveBayes(V.test[,-19],V.test[,19])
result <-predict(cB, V.train[,-19])
klasa<-V.test$Class

blad<-1-sum(result==klasa)/length(klasa)


