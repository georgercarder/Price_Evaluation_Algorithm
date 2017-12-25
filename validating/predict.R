#!/bin/Rscript

###########################################################################
# this is where is "all comes together" (validating)
#
# be sure that the following data from training directory is contained
# in this validating directory:
# samp BRANDCATSLOPESdesc2 BRANDCATSLOPESname2 
# BRANDS BRANDSHIPPINGSLOPES2 CATS STDMEANBRANDCAT stdXYZ
#
# be sure to "engineer" the following data from samp using the *.R scripts
# contained in this directory:
# brandindesc brandinname ndesc nname Bdesc Bname
#
# this script is UNDER CONSTRUCTION and will be build incrementally
# and tested along the way
###########################################################################

load("samp")
load("STDMEANBRANDCAT")

N<-nrow(samp)
priceee<-rep(0,N)
stdbrndcat<-rep(0,N)
samp$priceee<-priceee
samp$stdbrndcat<-stdbrndcat


load("BRANDSHIPPINGSLOPES2")
#shipping brandinname brandindesc

priceee2<-rep(0,N)
shipslp<-rep(0,N)
brandinnameslp<-rep(0,N)
brandindescslp<-rep(0,N)

samp$priceee2<-priceee2
samp$shipslp<-shipslp
samp$brandinnameslp<-brandinnameslp
samp$brandindescslp<-brandindescslp

##just to be sure we have samp in order we want for ship *inname *indesc


NN<-nrow(STDMEANBRANDCAT)

# note we are iterating on rows of MEANBRANDCAT
i=1
while(i<=NN){

    samp$priceee[samp$brand1==STDMEANBRANDCAT[i,1]&samp$cat1==STDMEANBRANDCAT[i,2]]=STDMEANBRANDCAT[i,3]

    samp$stdbrndcat[samp$brand1==STDMEANBRANDCAT[i,1]&samp$cat1==STDMEANBRANDCAT[i,2]]=STDMEANBRANDCAT[i,4]       

    samp$shipslp[samp$brand1==STDMEANBRANDCAT[i,1]&samp$cat1==STDMEANBRANDCAT[i,2]]=BRANDSHIPPINGSLOPES2[i,1]
    samp$brandinnameslp[samp$brand1==STDMEANBRANDCAT[i,1]&samp$cat1==STDMEANBRANDCAT[i,2]]=BRANDSHIPPINGSLOPES2[i,2]
    samp$brandindescslp[samp$brand1==STDMEANBRANDCAT[i,1]&samp$cat1==STDMEANBRANDCAT[i,2]]=BRANDSHIPPINGSLOPES2[i,3]   

print(i)
i=i+1
}

load("stdXYZ")
load("nname")
load("ndesc")
samp$nname<-nname
samp$ndesc<-ndesc
rm(nname,ndesc)

NN<-nrow(stdXYZ)

z<-rep(0,N)
samp$z<-z

i=1

while(i<=NN){

    samp$z[samp$nname==stdXYZ[i,2]&samp$ndesc==stdXYZ[i,1]]=stdXYZ[i,3]

print(i)
i=i+1
}

samp$nname<-NULL
samp$ndesc<-NULL

samp$priceee2<-samp$priceee+samp$z*samp$stdbrndcat

## now do a simple declarative script

#samp$priceee2<-samp$priceee+(1/6)*(samp$shipping*samp$shipslp+samp$brandinname*samp$brandinnameslp+samp$brandindesc*samp$brandindescslp)
#samp$priceee2[samp$priceee2<0]=0

