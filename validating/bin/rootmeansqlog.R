#!/bin/Rscript


# given P prediction vector and A actual vector

rmsl<-function(p,a){return(sqrt((1/length(p))*sum((log(p+1)-log(a+1))^2)))}
