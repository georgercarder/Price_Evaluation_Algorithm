#!/bin/Rscript

# under 1 minute

load("./var/samp")
N<-nrow(samp)
ndescV<-rep(0,N)

i=1

while(i<=N){

    ndescV[i]=nchar(samp$item_desc[i])

print(i)
i=i+1
}

save(ndescV,file="./var/ndescV")
rm(list=ls())


