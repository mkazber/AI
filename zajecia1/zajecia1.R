library(class)

dane <-read.table("/home/student/Pobrane/zajecia1/iris.csv",header =T ,sep =",")

m_irys<-matrix(nrow=150,ncol=4)

m_irys[,1]<-dane$ddk
m_irys[,2]<-dane$sdk
m_irys[,3]<-dane$dp
m_irys[,4]<-dane$sp

klasa<-dane$klasa

wynik<-knn(m_irys,m_irys,klasa,1)

blad<-1-sum(wynik==klasa)/length(klasa)
