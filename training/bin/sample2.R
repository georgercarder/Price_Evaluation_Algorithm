#!/bin/Rscript

# recovers samp from trn and trnMASTER


load("./var/trn")

S<-trn$train_id
S<-S+1

rm(trn)

load("./var/trnMASTER")

N<-nrow(trn)

NN<-1:N

NNN<-NN[!(NN %in% S)]

A<-trn[NNN,]

rm(trn)

samp<-A

save(samp,file="./var/samp")

#rm(list=ls())
