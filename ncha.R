#!/bin/Rscript

N<-nrow(trn)
A<-rep(0,N)

i=1

while(i<=N){

    A[i]=nchar(trn$item_desc[i])

print(i)
i=i+1
}
