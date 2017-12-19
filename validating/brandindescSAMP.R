#!/bin/Rscript

# 19 minutes

load("BRANDS")
load("samp")



Nb<-length(BRANDS)
brandindesc<-rep(0,nrow(samp))
samp$brandindesc<-brandindesc

lowBRANDS<-tolower(BRANDS)
lowdesc<-tolower(samp$item_desc)
samp$lowdesc<-lowdesc

i=2
while(i<=Nb){

    brand<-lowBRANDS[i]

    samp$brandindesc[samp$brnd_name==BRANDS[i]&grepl(brand,samp$lowdesc)]=1  
  
print(i)
i=i+1
}

brandindesc<-samp$brandindesc
save(brandindesc,file="brandindesc")
save(samp,file="samp")
rm(list=ls())

