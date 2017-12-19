#!/bin/Rscript

# under 1 minute

load("samp")
N<-nrow(samp)
ndesc<-rep(0,N)

i=1

while(i<=N){

    ndesc[i]=nchar(samp$item_desc[i])

print(i)
i=i+1
}

save(ndesc,file="ndesc")
rm(ndesc)


