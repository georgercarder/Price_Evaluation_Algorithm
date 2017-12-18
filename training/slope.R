#!/bin/Rscript

#given indicators from matrix. wtf "slope"
#i.e. for each token in A from matrix need associated slope
#build headless trn to have
# price brand cat_name item-condition_id shipping

load("Bname")
load("Bdesc")
load("BRANDCAT")
load("brandindesc")
load("brandinname")


load("trn")


TRNMICRO<-trn[,c(6,7,12,13)]
TRNMICRO$brandinname<-brandinname
TRNMICRO$brandindesc<-brandindesc

rm(brandinname,brandindesc)

Aname<-cbind(TRNMICRO,Bname)
Adesc<-cbind(TRNMICRO,Bdesc)

N<-nrow(BRANDCAT)
NN<-ncol(Bname)
n<-nrow(TRNMICRO)

rm(Bname)
rm(Bdesc)
save(TRNMICRO,file="TRNMICRO")
rm(TRNMICRO)
rm(trn)

BRANDCATSLOPESname<-matrix(0,nrow=N,ncol=NN)
BRANDCATSLOPESdesc<-matrix(0,nrow=N,ncol=NN)





##+6

i=1
while(i<=N){
    TRNname<-Aname[Aname$brand1==BRANDCAT[i,1]&Aname$cat1==BRANDCAT[i,2],]
    TRNdesc<-Adesc[Adesc$brand1==BRANDCAT[i,1]&Adesc$cat1==BRANDCAT[i,2],]
    j=1
    while(j<=NN){
                     
        if(length(TRNname$price[TRNname[,j+6]==1])==0|length(TRNname$price[TRNname[,j+6]==0])==0){
        
        BRANDCATSLOPESname[i,j]=0

        }else{
        BRANDCATSLOPESname[i,j]<-mean(TRNname$price[TRNname[,j+6]==1])-mean(TRNname$price[TRNname[,j+6]==0])}
        if(length(TRNdesc$price[TRNdesc[,j+6]==1])==0|length(TRNdesc$price[TRNdesc[,j+6]==0])==0){
        
        BRANDCATSLOPESdesc[i,j]=0

        }else{        
        BRANDCATSLOPESdesc[i,j]<-mean(TRNdesc$price[TRNdesc[,j+6]==1])-mean(TRNdesc$price[TRNdesc[,j+6]==0])   
        }    
    print(j)
    j=j+1
    }
print(" ")
print(" ")
print(" ")
print(" ")
print(i)
i=i+1
}

save(BRANDCATSLOPESname,file="BRANDCATSLOPESname")
save(BRANDCATSLOPESdesc,file="BRANDCATSLOPESdesc")
rm(BRANDCATSLOPESname,BRANDCATSLOPESdesc)




