#!/bin/Rscript

load("trn")
N<-nrow(trn)
nname<-rep(0,N)

i=1

while(i<=N){

    nname[i]=nchar(trn$name[i])

print(i)
i=i+1
}


save(nname,file="nname")
rm(nname)
