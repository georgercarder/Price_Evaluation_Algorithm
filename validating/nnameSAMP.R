#!/bin/Rscript

# under 1 minute

load("samp")
N<-nrow(samp)
nnameV<-rep(0,N)

i=1

while(i<=N){

    nnameV[i]=nchar(samp$name[i])

print(i)
i=i+1
}


save(nnameV,file="nnameV")
rm(nnameV)
