#!/bin/Rscript

load("BRANDS")
load("CATS")
load("trn")

brand1<-rep(0,nrow(trn))
cat1<-rep(0,nrow(trn))
trn$brand1<-brand1
trn$cat1<-cat1

N<-length(BRANDS)
NN<-length(CATS)
i=1
while(i<=N){
    trn$brand1[trn$brnd_name==BRANDS[i]]=i    
print(i)
i=i+1
}

i=1
while(i<=NN){
    trn$cat1[trn$cat_name==CATS[i]]=i
print(i)
i=i+1
}

save(trn,file="trn")
rm(list=ls())

