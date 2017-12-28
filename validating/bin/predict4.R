#!/bin/Rscript

load("./var/simp")
load("./var/trin")

euc<-function(x,y){return(sqrt(sum((x-y)^2)))}
rep.row<-function(x,n){
   matrix(rep(x,each=n),nrow=n)
}

N<-nrow(simp)

priceee<-rep(0,N)

simp$priceee<-priceee

dist<-rep(0,nrow(trin))
trin$dist<-dist

tt<-nrow(trin)

i=1

while(i<=N){

    A<-trin[trin$cat1==simp$cat1[i]&trin$brand1==simp$brand1[i]&trin$shipping==simp$shipping[i],]
  

    NN<-nrow(A)
    if(NN>0){
        
        A$dist=sqrt(rowSums((A[,3:100]-as.double(rep.row(simp[i,3:100],NN)))^2))



    }else{
        A<-trin[trin$cat1==simp$cat1[i],]
        NN<-nrow(A)
        A$dist=sqrt(rowSums((A[,3:100]-as.double(rep.row(simp[i,3:100],NN)))^2))
    
    
    }
    
    

    simp$priceee[i]=mean(head(A$price[order(A$dist)],5))    

print(i)
i=i+1
}
