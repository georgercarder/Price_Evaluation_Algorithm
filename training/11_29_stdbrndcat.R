#!/bin/Rscript

load("MEANBRANDCAT")
load("trn")

N<-nrow(MEANBRANDCAT)

STDMEANBRANDCAT<-cbind(MEANBRANDCAT,rep(0,N))

rm(MEANBRANDCAT)

i=1

while(i<=N){

    A<-trn$price[trn$brand1==STDMEANBRANDCAT[i,1]&trn$cat1==STDMEANBRANDCAT[i,2]]
    M<-STDMEANBRANDCAT[i,3]
    n<-length(A)
    if(n>1){
    STDMEANBRANDCAT[i,4]=sqrt((1/(n-1))*sum((A-M)^2))
    }else{
    STDMEANBRANDCAT[i,4]=0
    }
print(i)
i=i+1
}

save(STDMEANBRANDCAT,file="STDMEANBRANDCAT")
rm(list=ls())


