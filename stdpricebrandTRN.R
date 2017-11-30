#!/bin/Rscript

N<-nrow(trn)
stdevbrnd<-rep(0,N)
meanbrnd<-rep(0,N)

trn$stdevbrnd<-stdevbrnd
trn$meanbrnd<-meanbrnd

Nb<-nrow(BRANDSstddev)
i=1

while(i<=Nb){

    trn$stdevbrnd[trn$brnd_name==BRANDSstddev[i,1]]=rep(as.double(BRANDSstddev[i,2]),length(trn$stdevbrnd[trn$brnd_name==BRANDSstddev[i,1]]))
    
    trn$meanbrnd[trn$brnd_name==BRANDSstddev[i,1]]=rep(mean(trn$price[trn$brnd_name==BRANDSstddev[i,1]]),length(trn$brnd_name[trn$brnd_name==BRANDSstddev[i,1]]))
print(i)
i=i+1
}
