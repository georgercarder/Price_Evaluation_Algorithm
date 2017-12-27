#!/bin/Rscript

load("./var/BRANDCAT")
load("./var/trn")

N<-nrow(BRANDCAT)

MEANBRANDCAT<-cbind(BRANDCAT,rep(0,N))

rm(BRANDCAT)

i=1

while(i<=N){

    
    
        MEANBRANDCAT[i,3]=mean(trn$price[trn$brand1==MEANBRANDCAT[i,1]&trn$cat1==MEANBRANDCAT[i,2]])
   

print(i)
i=i+1
}

save(MEANBRANDCAT,file="./var/MEANBRANDCAT")
rm(list=ls())


