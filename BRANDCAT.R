#!/bin/Rscript

load("trn")
BRANDS<-unique(trn$brnd_name)
CATS<-unique(trn$cat_name)
save(BRANDS,file="BRANDS")
save(CATS,file="CATS")


N<-length(BRANDS)


CATS<-unique(trn$cat_name)

##WE FIND HOW MANY ROWS

rowwie=0upload files to github but ignore large files
i=2
while(i<=N){

    rowwie=rowwie+length(unique(trn$cat_name[trn$brnd_name==BRANDS[i]]))

print(rowwie)
print(i)
i=i+1
}

BRANDCAT<-matrix(0,nrow=rowwie,ncol=2)

i=1
j=2
while(j<=N){

    A<-unique(trn$cat_name[trn$brnd_name==BRANDS[j]])
    NN<-length(A)upload files to github but ignore large files
    k=1
    while(k<=NN){
        BRANDCAT[i,1]=j
        BRANDCAT[i,2]=which(CATS==A[k])
        print(i)
        i=i+1
        k=k+1
    }

j=j+1
}

save(BRANDCAT,file="BRANDCAT")








