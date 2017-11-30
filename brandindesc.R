#!/bin/Rscript

load("BRANDS")



Nb<-length(BRANDS)
brandindesc<-rep(0,nrow(trn))
trn$brandindesc<-brandindesc

lowBRANDS<-tolower(BRANDS)
lowdesc<-tolower(trn$item_desc)
trn$lowdesc<-lowdesc

i=2
while(i<=Nb){

    brand<-lowBRANDS[i]

    trn$brandindesc[trn$brnd_name==BRANDS[i]&grepl(brand,trn$lowdesc)]=1  
  
print(i)
i=i+1
}



