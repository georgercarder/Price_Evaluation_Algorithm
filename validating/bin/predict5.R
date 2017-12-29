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

NNN<-length(unique(simp[,c(3,4)]))
i=1

while(i<=NNN){

    A<-trin[trin$cat1==unique(simp$cat1)[i,1]&trin$brand1==unique(simp$brand1)[i,2],]
  

    #NN<-nrow(A)
    #if(NN>0){

    deliberate error lots of work to do indexing over unique(simp[,c(3,4)])
        
        trin$dist=sqrt(rowSums((trin[,3:100]-as.double(rep.row(simp[i,3:100],tt)))^2))



    #}else{
     #   A<-trin[trin$cat1==simp$cat1[i],]
      #  NN<-nrow(A)
       # A$dist=sqrt(rowSums((A[,3:100]-as.double(rep.row(simp[i,3:100],NN)))^2))
    
    
    #}
    
    # .63 5 140
    # .68 3 140
    # .61 10 140

    simp$priceee[i]=mean(head(trin$price[order(trin$dist)],10))    

print(i)
i=i+1
}
