#!/bin/Rscript

# under 1 minute

load("samp")
N<-nrow(samp)
nname<-rep(0,N)

i=1

while(i<=N){

    nname[i]=nchar(samp$name[i])

print(i)
i=i+1
}


save(nname,file="nname")
rm(nname)
