library(class)
library(adabag)
library(randomForest)

data(iris)
l.obs <- nrow(iris)
sub <-sample(1:l.obs,round(l.obs/3),replace = FALSE)
I.train <- iris[-sub,]
I.test <- iris[sub,]


iris.rf <- randomForest(Species ~ ., data=I.train,  importance=TRUE, proximity=TRUE)
result <-predict(iris.rf,I.test[-5],type = 'class')
tablica <-I.test[,5]
blad<-1-sum(result==tablica)/length(tablica)

iris.rf$importance