#!/bin/Rscript

# 19 minutes

load("./var/BRANDS")
load("./var/samp")



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
save(brandindesc,file="./var/brandindesc")
save(samp,file="./var/samp")
rm(list=ls())

