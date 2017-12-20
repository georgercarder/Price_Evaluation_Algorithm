#!/bin/Rscript

load("BRANDCAT")
load("TRNMICRO")

N<-nrow(BRANDCAT)

MEANBRANDCAT<-cbind(BRANDCAT,rep(0,N))

rm(BRANDCAT)

i=1

while(i<=N){

    
    
        MEANBRANDCAT[i,3]=mean(TRNMICRO$price[TRNMICRO$brand1==MEANBRANDCAT[i,1]&TRNMICRO$cat1==MEANBRANDCAT[i,2]])
   

print(i)
i=i+1
}

save(MEANBRANDCAT,file="MEANBRANDCAT")


