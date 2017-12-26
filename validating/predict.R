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

## revised list of included data: 
## BRANDS CATS
## trn nname ndesc Bdesc Bname
## samp nnameV ndescV BdescV BnameV
###########################################################################


# first step is constructing samp having only integer values in standard way
load("samp")
# first get indicators
simp<-samp[,c(3,7,12,14)] #"item_condition_id" "shipping" "brandinname" "brandindesc" 
# now build brand1,cat1
simp<-cbind(samp[,c(17,16)],simp) # cat1 brand1
# last get train_id and price
simp<-cbind(samp[,c(1,6)],simp) # train_id price
## still need to tag on nname ndesc BnameV BdescV
rm(samp)
##
load("nnameV")
load("ndescV")
simp<-cbind(simp,nnameV,ndescV)
rm(nnameV,ndescV)
## tag on BnameV BdescV
load("BnameV")
simp<-cbind(simp,BnameV)
rm(BnameV)
load("BdescV")
simp<-cbind(simp,BdescV)
rm(BdescV)
##
save(simp,file="simp")
rm(simp)

#######################################################
# simp is built
#######################################################
#######################################################
# now to build trin
#######################################################

load("trn")

# first get indicators
trin<-trn[,c(3,7)] #"item_condition_id" "shipping" "brandinname"
throwing error because ..
need to cleanup here in training folder, need to have brandinname saved w/trn ##"brandindesc" 
# now build brand1,cat1
trin<-cbind(trn[,c()],trin) # cat1 brand1
# last get train_id and price
trin<-cbind(trn[,c(1,6)],trin) # train_id price
## still need to tag on nname ndesc BnameV BdescV
rm(trn)
##
load("nname")
load("ndesc")
trin<-cbind(trin,nname,ndesc)
rm(nname,ndesc)
## tag on BnameV BdescV
load("Bname")
trin<-cbind(trin,Bname)
rm(Bname)
load("Bdesc")
trin<-cbind(trin,Bdesc)
rm(Bdesc)
##
save(trin,file="trin")


############################
rm(list=ls())
############################
load("trin")
load("simp")




# appending ndesc nname BdescV BnameV

# same for trn

# find A<-restriction of trn to category

# for each listing of samp, create distance vector for A

# average k NN
