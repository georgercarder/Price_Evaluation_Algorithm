#!/bin/Rscript

load("MEANCAT")
load("TRNMICRO")

N<-nrow(MEANCAT)

STDMEANCAT<-cbind(MEANCAT,rep(0,N))

rm(MEANCAT)

i=1

while(i<=N){

    A<-TRNMICRO$price[TRNMICRO$cat1==STDMEANCAT[i,1]]
    M<-STDMEANCAT[i,2]
    n<-length(A)
    if(n>1){
    STDMEANCAT[i,3]=sqrt((1/(n-1))*sum((A-M)^2))
    }else{
    STDMEANCAT[i,3]=0
    }
print(i)
i=i+1
}

save(STDMEANCAT,file="STDMEANCAT")


