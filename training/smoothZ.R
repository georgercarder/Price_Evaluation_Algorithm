#!/bin/Rscript

eucd<-function(x,y)sqrt(sum((x-y)^2))
N<-nrow(xyz)
XYZ<-xyz
Z<-rep(0,N)

i=1
while(i<=N){

    if(is.nan(XYZ[i,3])){

        A<-XYZ[!is.nan(XYZ[,3]),]
        NN<-nrow(A)
        D<-rep(0,NN)
        j=1
        while(j<=NN){
            D[j]=eucd(c(A[j,1],A[j,2]),c(XYZ[i,1],XYZ[i,2]))
        #print(j)
        j=j+1
        }

        m=which(D==min(D))[1]
        Z[i]=A[m,3]
        XYZ[i,3]<-Z[i] 

    }
   


print(" ")
print(i)
i=i+1
}
