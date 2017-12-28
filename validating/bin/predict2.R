#!/bin/Rscript

load("./var/simp")
load("./var/trin")

euc<-function(x,y){return(sqrt(sum((x-y)^2)))}

N<-nrow(simp)

priceee<-rep(0,N)

simp$priceee<-priceee

dist<-rep(0,nrow(trin))
trin$dist<-dist

tt<-nrow(trin)

i=1

while(i<=N){

    A<-trin[trin$cat1==simp$cat1[i]&trin$brand1==simp$brand1[i]&trin$shipping==simp$shipping[i],]
  #  A<-A[A$shipping==simp$shipping[i],]


    NN<-nrow(A)
    if(NN>0){
    if(NN>100){
        A<-A[1:100,]
        NN=100
    }
    j=1
    while(j<=NN){
        A$dist[j]=euc(A[j,3:100],simp[i,3:100])
    
    j=j+1
    }
    }else{
    A<-trin[trin$cat1==simp$cat1[i],]
    NN<-nrow(A)
    if(NN>100){
        A<-A[1:100,]
        NN=100
    }
    j=1
    while(j<=NN){
        A$dist[j]=euc(A[j,3:100],simp[i,3:100])
    
    j=j+1
    }
    

    }
    
    

    simp$priceee[i]=mean(head(A$price[order(A$dist)],3))    

print(i)
i=i+1
}
