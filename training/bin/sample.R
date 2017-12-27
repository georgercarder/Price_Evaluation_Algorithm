#!/bin/Rscript

#trn<-read.csv("train.tsv",header=TRUE,sep="\t")
#save(trn,file="./var/trnMASTER")

load("./var/trnMASTER")

A<-trn[trn$price!=0,]

trn<-A

save(trn,file="./var/trnCLEAN")

N<-nrow(trn)

s<-as.integer(0.03*N)

S<-sort(sample(1:N,s,replace=FALSE))

samp<-trn[S,]

save(samp,file="./var/samp")
##move samp to validating folder later

NN<-1:N

NNN<-NN[!(NN %in% S)]

A<-trn[NNN,]

trn<-A

save(trn,file="./var/trn")




