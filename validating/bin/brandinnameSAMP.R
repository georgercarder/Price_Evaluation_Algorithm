#!/bin/Rscript

# 5 minutes

load("./var/BRANDS")
load("./var/samp")



Nb<-length(BRANDS)
brandinname<-rep(0,nrow(samp))
samp$brandinname<-brandinname

lowBRANDS<-tolower(BRANDS)
lowname<-tolower(samp$name)
samp$lowname<-lowname

i=2
while(i<=Nb){

    brand<-lowBRANDS[i]

    samp$brandinname[samp$brnd_name==BRANDS[i]&grepl(brand,samp$lowname)]=1  
  
print(i)
i=i+1
}

brandinname<-samp$brandinname
save(brandinname,file="./var/brandinname")
save(samp,file="./var/samp")
rm(list=ls())

