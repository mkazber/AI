library(class)
library(e1071)

dane1 <-read.table("/home/student/Pobrane/Zajecia2/iris_train.csv",header =T ,sep =",")
dane2 <-read.table("/home/student/Pobrane/Zajecia2/iris_test.csv",header =T ,sep =",")

cB2 <- naiveBayes(dane2[,-5],dane2[,5])
result2 <-predict(cB2, dane1)
klasa2<-dane2$klasa

blad<-1-sum(result2==klasa2)/length(klasa2)
