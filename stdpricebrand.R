#!/bin/Rscript

BRANDS<-unique(trn$brnd_name)
Nb<-length(BRANDS)
BRANDSTDDEV<-rep(0,Nb)

i=1

while(i<=Nb){


    M<-mean(trn$price[trn$brnd_name==BRANDS[i]])
    D<-trn$price[trn$brnd_name==BRANDS[i]]-M
    nn<-length(trn$price[trn$brnd_name==BRANDS[i]])
    if(nn>1){
    BRANDSTDDEV[i]=sqrt(sum(D^2)/(nn-1))
    }

print(i)
i=i+1
}

save(BRANDS,file="BRANDS")
save(BRANDSTDDEV,file="BRANDSTDDEV")
BRANDSstddev<-cbind(BRANDS,BRANDSTDDEV)
