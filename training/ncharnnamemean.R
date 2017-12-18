#!/bin/Rscript

load("ndesc")
load("nname")
load("trn")
trn$ndesc<-ndesc
trn$nname<-nname

rm(ndesc,nname)

X<-sort(unique(trn$ndesc))
Y<-sort(unique(trn$nname))


height<-function(x,y){return(mean(trn$price[trn$ndesc==x&trn$nname==y]))}

N<-length(X)*length(Y)
xyz<-matrix(0,nrow=N,ncol=3)

Nx<-length(X)
Ny<-length(Y)
i=1
I=1
while(i<=Nx){

    j=1
    while(j<=Ny){
        xyz[I,1]=X[i]
        xyz[I,2]=Y[j]
        xyz[I,3]=height(X[i],Y[j])
        print(I)
        I=I+1
    j=j+1
    }

print("")
print("")

print(i)
i=i+1
}






