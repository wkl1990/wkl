##Description: psychENCODE sample filter and gene filter
##Author: Michael, WKL 
##Data: 20180226
##Environment: R3.3

library(WGCNA); 
library(dplyr)
options(stringsAsFactors = F)

#sample filter
sdout <- 2; 
normadj <- (0.5+0.5*bicor(tpm, use='pairwise.complete.obs'))^2
netsummary <- fundamentalNetworkConcepts(normadj);
K <- netsummary$Connectivity; Z.K <- (K-mean(K))/sqrt(var(K))
C <- netsummary$ClusterCoef; Z.C = (C - mean(C))/sqrt(var(C))
outliers <- (Z.K > mean(Z.K)+sdout*sd(Z.K))|(Z.K < mean(Z.K)-sdout*sd(Z.K))
print(paste("There are ",sum(outliers)," outliers samples based on a bicor distance sample network connectivity standard deviatiion above sdout", sep="")); 
# print(colnames(tpm)[outliers]); 
# print(table(outliers))
plot(Z.K, col = as.numeric(datMeta$study), pch=19, main="Outlier detection", ylab="Network connectivity (z score)")
# plot(Z.K, col = as.numeric(outliers)+1, pch=19, main="Outlier detection", ylab="Network connectivity (z score)")
plabline(h=-2, lty=2)
# abline(h=c(2,-2), lty=2)
legend("bottomleft",legend = levels(datMeta$study), col=1:7,pch=19,cex=.7)
# legend("bottomleft",legend = c("non-outliers","outliers"), col=1:2,pch=19,cex=.7)




