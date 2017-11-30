#!/bin/Rscript

#after ncharnnamemean.R used smoothZ.R to give values to NaNs.
# now we scale wrt std and mean for trn$price

m<-mean(trn$price)

std<-sqrt((1/(nrow(trn)-1))*sum((trn$price-m)^2))

stdXYZ<-XYZ

stdXYZ[,3]=(XYZ[,3]-m)/std
