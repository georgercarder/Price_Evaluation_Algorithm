#!/bin/Rscript

load("trn")
N<-nrow(trn)
ndesc<-rep(0,N)

i=1

while(i<=N){

    ndesc[i]=nchar(trn$item_desc[i])

print(i)
i=i+1
}

save(ndesc,file="ndesc")
rm(ndesc)


