library(class)

dane1 <-read.table("/home/student/Pobrane/zajecia1/iris_train.csv",header =T ,sep =",")
dane2 <-read.table("/home/student/Pobrane/zajecia1/iris_test.csv",header =T ,sep =",")

m_irys_test<-matrix(nrow=106,ncol=4)
m_irys_train<-matrix(nrow=44,ncol=4)

m_irys_test[,1]<-dane1$ddk
m_irys_test[,2]<-dane1$sdk
m_irys_test[,3]<-dane1$dp
m_irys_test[,4]<-dane1$sp

m_irys_train[,1]<-dane2$ddk
m_irys_train[,2]<-dane2$sdk
m_irys_train[,3]<-dane2$dp
m_irys_train[,4]<-dane2$sp

klasa1<-dane1$klasa
klasa2<-dane2$klasa


wynik<-knn(m_irys_test,m_irys_train,klasa1,1)


blad1<-1-sum(wynik==klasa2)/length(klasa2)



