#!/bin/Rscript

load("CATS")
load("trnsmall")

N<-length(CATS)


CATSTD<-cbind(CATS,rep(0,N))
rm(CATS)

i=1

while(i<=N){
        A<-trn$price[trn$cat_name==CATSTD[i,1]]
        NN<-length(A)
        m<-mean(A)


            CATSTD[i,2]<-sqrt((1/(NN-1))*sum((A-m)^2))        
       


print(i)
i=i+1
}


