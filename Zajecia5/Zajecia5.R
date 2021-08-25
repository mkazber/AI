library(class)
library(e1071)
library(mlbench)
library(nnet)
library(NeutralNetTools)

data(iris)
l.obs <- nrow(iris)
sub <-sample(1:l.obs,round(l.obs/3),replace = FALSE)
I.train <- iris[-sub,]
I.test <- iris[sub,]

iris.nnet <- nnet(Species ~ .,I.train, size=2,rang=0.1,maxit=150)

result <-predict(iris.nnet,I.test[-5],type = 'class')
tablica <-I.test[,5]
blad<-1-sum(result==tablica)/length(tablica)
plotnet(iris.nnet)
