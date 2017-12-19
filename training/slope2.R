#!/bin/Rscript

# we find slopes for zero entries from slope.R

load("Bname")
load("Bdesc")
load("BRANDCAT")
load("brandindesc")
load("brandinname")
load("BRANDCATSLOPESname")
load("BRANDCATSLOPESdesc")



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

BRANDCATSLOPESname2<-BRANDCATSLOPESname
BRANDCATSLOPESdesc2<-BRANDCATSLOPESdesc







i=1
while(i<=N){
    TRNname<-Aname[Aname$cat1==BRANDCAT[i,2],]
    TRNdesc<-Adesc[Adesc$cat1==BRANDCAT[i,2],]
    j=1
    while(j<=NN){
                     
        if(BRANDCATSLOPESname[i,j]==0){        
            if(length(TRNname$price[TRNname[,j+6]==1])==0|length(TRNname$price[TRNname[,j+6]==0])==0){
                BRANDCATSLOPESname2[i,j]=0    
            }else{
            BRANDCATSLOPESname2[i,j]<-mean(TRNname$price[TRNname[,j+6]==1])-mean(TRNname$price[TRNname[,j+6]==0])
            }
        }
        if(BRANDCATSLOPESdesc[i,j]==0){
            if(length(TRNdesc$price[TRNdesc[,j+6]==1])==0|length(TRNdesc$price[TRNdesc[,j+6]==0])==0){
                BRANDCATSLOPESdesc2[i,j]=0
            }else{
            BRANDCATSLOPESdesc2[i,j]<-mean(TRNdesc$price[TRNdesc[,j+6]==1])-mean(TRNdesc$price[TRNdesc[,j+6]==0])   
            }
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

save(BRANDCATSLOPESname2,file="BRANDCATSLOPESname2")
save(BRANDCATSLOPESdesc2,file="BRANDCATSLOPESdesc2")
rm(BRANDCATSLOPESname,BRANDCATSLOPESdesc,BRANDCATSLOPESname2,BRANDCATSLOPESdesc2)




