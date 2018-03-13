##Description: PCA plot 
##Author: WKL
##Date: 20180227
##Environment: R3.3

#step-by-step pca plot
normalPCA <- function(data, main="PCA plot"){
	pcdata <- princomp(data,cor=T)
	# pdf("pca1.pdf")
	plot(pcdata$loadings,pch=18,main=main)
	text(pcdata$loadings,substring(row.names(pcdata$loadings),8),pos=4,cex=.7)
	# text(pcdata$loadings,sub("SAMPLE_"," ",rownames(pcdata$loadings)),pos=4,cex=.7)
	# dev.off()
}


#one step pca auto-plot
onestepPCA <- function(data, trait, colour, label=FALSE){
	datat <- t(data) 
	alldata <- data.frame(datat,trait)
	# suppressMessages(library(ggfortify))
	pcaplot <- autoplot(prcomp(alldata[,c(1:nrow(data))]),data=alldata,colour=colour,label=label)
	# pdf("pca2.pdf")
	plot(pcaplot)
	# dev.off()
}
#Usage: onestepPCA(data=data,trait=trait_data,colour="Sex",label=TRUE)
