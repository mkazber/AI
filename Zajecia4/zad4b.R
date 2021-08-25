library(class)
library(adabag)
library(randomForest)

data(Vehicle)
l.obs <- nrow(Vehicle)
sub <-sample(1:l.obs,round(l.obs/3),replace = FALSE)
V.train <- Vehicle[-sub,]
V.test <- Vehicle[sub,]

Vehicle.adaboost <- bagging(Class ~.,data=V.train,boos=TRUE,mfinal=3 )
result <-predict(Vehicle.adaboost,V.test[-19],type = 'class')
klasa<-V.test$Class
blad<-1-sum(result$class==klasa)/length(klasa)

Vehicle.adaboost$votes
Vehicle.adaboost$importance
