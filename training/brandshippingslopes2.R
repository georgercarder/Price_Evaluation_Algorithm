#!/bin/Rscript

load("BRANDSHIPPINGSLOPES")
load("TRNMICRO")
load("BRANDCAT")

A<-TRNMICRO[,c(2,5,6)]
B<-TRNMICRO[,c(3,4)]
price<-TRNMICRO$price

TRNMICRO<-cbind(B,A,price)
rm(A,B,price)

N<-nrow(BRANDSHIPPINGSLOPES)
BRANDSHIPPINGSLOPES2<-BRANDSHIPPINGSLOPES


i=1
while(i<=N){
    
    j=1
    while(j<=3){
        if(BRANDSHIPPINGSLOPES[i,j]==0){
            A<-TRNMICRO[TRNMICRO$cat1==BRANDCAT[i,2],]
            if(!(length(A$price[A[,2+j]==1])==0|length(A$price[A[,2+j]==0])==0)){
            BRANDSHIPPINGSLOPES2[i,j]<-mean(A$price[A[,2+j]==1])-mean(A$price[A[,2+j]==0])
            }
        }        

    j=j+1
    }

print(i)
i=i+1
}

save(BRANDSHIPPINGSLOPES2,file="BRANDSHIPPINGSLOPES2")
rm(list=ls())
