#!/bin/Rscript

# 1 minute

load("./var/samp")

A<-c("shipping","free","worn","minor","never","paid","use","rare","very","new","authentic","box","pet","smoke","cute","trades","womens","mens","boys","girls","super","cheap","slightly","damaged","like","perfect","condition","no tags","with tags","fast","\\[rm\\]","^[ A-Z]+$","[A-Z]{2,}","^[SML] | [SML] |^X+L | X+L |^X+S | X+S ","small|medium|large","[0-9]","^[a-z]","^No description yet$","^No description yet.*[ 0-9a-zA-Z]$|^[ 0-9a-zA-Z].*No description yet$","\\*+","•","[a-z][A-Z]","!","!{2,}","\\.")



#######


n<-length(A)
N<-nrow(samp)

BnameV<-matrix(0,nrow=N,ncol=n)
BdescV<-matrix(0,nrow=N,ncol=n)

samp$lowname<-tolower(samp$name)
samp$lowdesc<-tolower(samp$item_desc)

i=1
while(i<=n){

    token<-A[i]
    Cname<-rep(0,N)
    Cdesc<-rep(0,N)
    samp$Cname<-Cname
    samp$Cdesc<-Cdesc

    if(grepl("[A-Z]",A[i])){
    
    samp$Cname[grepl(token,samp$name)]=1
    samp$Cdesc[grepl(token,samp$item_desc)]=1

    BnameV[,i]=samp$Cname
    BdescV[,i]=samp$Cdesc

    }else{

    samp$Cname[grepl(token,samp$lowname)]=1
    samp$Cdesc[grepl(token,samp$lowdesc)]=1

    BnameV[,i]=samp$Cname
    BdescV[,i]=samp$Cdesc
    }

print(i)
i=i+1    
}

save(BnameV,file="./var/BnameV")
save(BdescV,file="./var/BdescV")
rm(list=ls())
            
