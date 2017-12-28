#!/bin/Rscript

load("./var/simp")
load("./var/trin")

euc<-function(x,y){return(sqrt(sum((x-y)^2)))}

N<-nrow(simp)

priceee<-rep(0,N)

simp$priceee<-priceee

dist<-rep(0,nrow(trin))
trin$dist<-dist

## try to get parallel up in here
library(doParallel)
library(foreach)
cl<-makeCluster(2)
registerDoParallel(cl)

AAA<-function(i){return(trin[trin$cat1==simp$cat1[i+1]&trin$brand1==simp$brand1[i+1]&trin$shipping==simp$shipping[i+1],])}

BBB<-function(i){
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
        return(mean(head(A$price[order(A$dist)],3)))
    } 

pair<-function(i,j){
if(i==1){
return(AAA(j))
}else{
return(BBB(j))
}
}  

i=1
 A<-trin[trin$cat1==simp$cat1[i]&trin$brand1==simp$brand1[i]&trin$shipping==simp$shipping[i],]

while(i<=N){
    
    ####
   
    ####

    P<-foreach(k=1:2) %dopar% pair(k,i)
    

    simp$priceee[i]=P[2]    
    A<-P[1]
    
print(i)
i=i+1
}

stopCluster(cl)
