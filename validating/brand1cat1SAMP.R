#!/bin/Rscript

# 1 minute

load("BRANDS")
load("CATS")
load("samp")

brand1<-rep(0,nrow(samp))
cat1<-rep(0,nrow(samp))
samp$brand1<-brand1
samp$cat1<-cat1

N<-length(BRANDS)
NN<-length(CATS)
i=1
while(i<=N){
    samp$brand1[samp$brnd_name==BRANDS[i]]=i    
print(i)
i=i+1
}

i=1
while(i<=NN){
    samp$cat1[samp$cat_name==CATS[i]]=i
print(i)
i=i+1
}

save(samp,file="samp")
rm(list=ls())

