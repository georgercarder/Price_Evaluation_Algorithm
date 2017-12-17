#!/bin/Rscript


A<-c("shipping","free","worn","minor","never","paid","use","rare","very","new","authentic","box","pet","smoke","cute","trades","womens","mens","boys","girls","super","cheap","slightly","damaged","like","perfect","condition","no tags","with tags","fast","\\[rm\\]","^[ A-Z]+$","[A-Z]{2,}","^[SML] | [SML] |^X+L | X+L |^X+S | X+S ","small|medium|large","[0-9]","^[a-z]","^No description yet$","^No description yet.*[ 0-9a-zA-Z]$|^[ 0-9a-zA-Z].*No description yet$","\\*+","•","[a-z][A-Z]","!","!{2,}","\\.")



#######


n<-length(A)
N<-nrow(trn)

Bname<-matrix(0,nrow=N,ncol=n)
Bdesc<-matrix(0,nrow=N,ncol=n)

trn$lowname<-tolower(trn$name)
trn$lowdesc<-tolower(trn$item_desc)

i=1
while(i<=n){

    token<-A[i]
    Cname<-rep(0,N)
    Cdesc<-rep(0,N)
    trn$Cname<-Cname
    trn$Cdesc<-Cdesc

    if(grepl("[A-Z]",A[i])){
    
    trn$Cname[grepl(token,trn$name)]=1
    trn$Cdesc[grepl(token,trn$item_desc)]=1

    Bname[,i]=trn$Cname
    Bdesc[,i]=trn$Cdesc

    }else{

    trn$Cname[grepl(token,trn$lowname)]=1
    trn$Cdesc[grepl(token,trn$lowdesc)]=1

    Bname[,i]=trn$Cname
    Bdesc[,i]=trn$Cdesc
    }

print(i)
i=i+1    
}

save(Bname,file="Bname")
save(Bdesc,file="Bdesc")
rm(Bname,Bdesc)
            
