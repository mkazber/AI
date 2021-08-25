library(class)
library(tree)
library(mlbench)

dane1 <-read.table("/home/student/Pobrane/Zajecia3/iris_train.csv",header =T ,sep =",")
dane2 <-read.table("/home/student/Pobrane/Zajecia3/iris_test.csv",header =T ,sep =",")


tree.iris <- tree(klasa ~., dane1)
plot(tree.iris)
text(tree.iris)
tree2.iris <-prune.tree(tree.iris,best=2)
plot(tree2.iris)
text(tree2.iris)
result <-predict(tree.iris,dane2[-5],type = 'class')
tablica <-dane2[,5]
blad<-1-sum(result==tablica)/length(tablica)
