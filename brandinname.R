#!/bin/Rscript

load("BRANDS")



Nb<-length(BRANDS)
brandinname<-rep(0,nrow(trn))
trn$brandinname<-brandinname

lowBRANDS<-tolower(BRANDS)
lowname<-tolower(trn$name)
trn$lowname<-lowname

i=2
while(i<=Nb){

    brand<-lowBRANDS[i]

    trn$brandinname[trn$brnd_name==BRANDS[i]&grepl(brand,trn$lowname)]=1  
  
print(i)
i=i+1
}



