#!/bin/Rscript


load("TRNMICRO")
load("BRANDCAT")

N<-nrow(BRANDCAT)
NN=3

BRANDSHIPPINGSLOPES<-matrix(0,nrow=N,ncol=3)

i=1

while(i<=N){

    A<-TRNMICRO[TRNMICRO$brand1==BRANDCAT[i,1]&TRNMICRO$cat1==BRANDCAT[i,2],]
    j=1
    while(j<=3){
        

        if(length(A$price[A[,1+j]==1])==0|length(A$price[A[,1+j]==0])==0){
            BRANDSHIPPINGSLOPES[i,j]=0
        }else{
            BRANDSHIPPINGSLOPES[i,j]<-mean(A$price[A[,1+j]==1])-mean(A$price[A[,1+j]==0])

        }

    j=j+1
    }
    

print(i)
i=i+1
}

save(BRANDSHIPPINGSLOPES,file="BRANDSHIPPINGSLOPES")
rm(list=ls())

