library(RoughSets)

data(iris)

l.obs <- nrow(iris)
sub <-sample(1:l.obs,round(l.obs/3),replace = FALSE)
I.train2 <-iris[-sub,]
I.test2 <-iris[sub,]

DC.train <-SF.asDecisionTable(I.train2,decision.attr = 5,indx.nominal = 5)
DC.test <-SF.asDecisionTable(I.test2,decision.attr = 5,indx.nominal = 5)

cut.values <- D.discretization.RST(DC.train,type.method = "global.discerenibility")

I.train <- SF.applyDecTable(DC.train, cut.values)
I.test <- SF.applyDecTable(DC.test, cut.values)

red.rst <- FS.feature.subset.computation(DC.train, method = "quickreduct.rst")
fs.tra <- SF.applyDecTable(DC.train, red.rst)

rules <- RI.indiscernibilityBasedRules.RST(da.Train, red.rst)

result <- predict(rules, da.Test, type = "class")
blad <- 1-sum(result$predictions==iris.test[,5])/length(iris.test[,5])