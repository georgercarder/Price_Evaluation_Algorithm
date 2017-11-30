#!/bin/Rscript

load("trn")
N<-nrow(trn)
nname<-rep(0,N)
trn$nname<-nname

i=1

while(i<=N){

    trn$nname[i]=nchar(trn$name[i])

print(i)
i=i+1
}

nname<-trn$nname
save(nname,file="nname")
rm(nname)
