#!/bin/Rscript

load("./var/trn")
N<-nrow(trn)
nname<-rep(0,N)

i=1

while(i<=N){

    nname[i]=nchar(trn$name[i])

print(i)
i=i+1
}


save(nname,file="./var/nname")
rm(nname)
