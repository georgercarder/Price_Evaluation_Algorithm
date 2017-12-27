#!/bin/Rscript

load("./var/trn")
BRANDS<-sort(unique(trn$brnd_name))
CATS<-sort(unique(trn$cat_name))
save(BRANDS,file="./var/BRANDS")
save(CATS,file="./var/CATS")


N<-length(BRANDS)


##WE FIND HOW MANY ROWS

rowwie=0
i=1
while(i<=N){

    rowwie=rowwie+length(unique(trn$cat_name[trn$brnd_name==BRANDS[i]]))

print(rowwie)
print(i)
i=i+1
}

BRANDCAT<-matrix(0,nrow=rowwie,ncol=2)

i=1
j=1
while(j<=N){

    A<-unique(trn$cat_name[trn$brnd_name==BRANDS[j]])
    NN<-length(A)
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

save(BRANDCAT,file="./var/BRANDCAT")








