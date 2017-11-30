#!/bin/Rscript

N<-nrow(trn)


s<-as.integer(0.03*N)

S<-sort(sample(1:N,s,replace=FALSE))

samp<-trn[S,]


