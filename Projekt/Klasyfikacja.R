library(class)
library(e1071)
library(adabag)
library(randomForest)
library(nnet)

daneHeart <-read.table("F:\\TomaszS\\heart.dat",header =T)

l.obs <- nrow(daneHeart)
tmp <-sample(1:l.obs,round(l.obs/3),replace = FALSE)
h.train <- daneHeart[-tmp,]
h.test <- daneHeart[tmp,]


#nnet

H.nett<-nnet(X2 ~.,h.train,size=2,rang=0.0001,decay=0)
result<-predict(H.nett,h.test[-14],type="raw")
klasa<-h.test$X2
blad_nnet_heart<-1-sum(result==klasa)/length(klasa)

#k

klasa1<-h.train$X2
klasa2<-h.test$X2
wynik_k<-knn(h.train[-14],h.test[-14],klasa1,k=8)
blad_k_heart<-1-sum(wynik_k==klasa2)/length(klasa2)

daneTransfusion <-read.table("F:\\TomaszS\\transfusion.data.txt",sep=",",header =T)

l.obs2 <- nrow(daneTransfusion)
tmp2 <-sample(1:l.obs2,round(l.obs2/3),replace = FALSE)
t.train <- daneTransfusion[-tmp2,]
t.test <- daneTransfusion[tmp2,]

#nnet

H.nett2<-nnet(whether.he.she.donated.blood.in.March.2007 ~.,t.train,size=2,rang=0.0001,decay=0)
result2<-predict(H.nett2,t.test[-5],type="raw")
klasa2<-t.test$whether.he.she.donated.blood.in.March.2007
blad_nnet_transfusion<-1-sum(result2==klasa2)/length(klasa2)

#k

klasa12<-t.train$whether.he.she.donated.blood.in.March.2007
klasa22<-t.test$whether.he.she.donated.blood.in.March.2007
wynik_k2<-knn(t.train[-5],t.test[-5],klasa12,k = 100)
blad_k_transfusion<-1-sum(wynik_k2==klasa22)/length(klasa22)



