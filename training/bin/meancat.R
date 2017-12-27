#!/bin/Rscript

load("./var/CATS")
load("./var/TRNMICRO")

N<-length(CATS)

MEANCAT<-cbind(CATS,rep(0,N))

rm(CATS)

i=1

while(i<=N){

    
    
        MEANCAT[i,2]=mean(TRNMICRO$price[TRNMICRO$cat1==MEANCAT[i,1]])
   

print(i)
i=i+1
}

save(MEANCAT,file="./var/MEANCAT")


