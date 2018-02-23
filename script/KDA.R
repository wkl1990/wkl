#Description: Key Driver Analysis (KDA)
#Author: Wang Kangli
#Data: 2018/02/01
#Environment: R3.3

library(KDA)
options(stringsAsFactors=FALSE)

#read network and gene list
psy_DGCR5 <- read.table("psychENCODE_DGCR5module_weight.txt",header=TRUE)
psy_DGCR5_net0.08 <- psy_DGCR5[which(psy_DGCR5$weight>0.08),c(1:2)]
#read gene list
szc_gene <- read.table("~/annotation/my_gene_sets/GWAS+DNM+GVEX+CMC DEGs.txt",header=TRUE)
#perform kda analysis
psy_DGCR5_net0.08_kda <- keyDriverAnalysis(psy_DGCR5_net0.08, szc_gene[,1], directed=FALSE, nlayer_expansion=1, nlayer_search=1, enrichedNodes_percent_cut=-1, boost_hubs=T, dynamic_search=FALSE, FET_pvalue_cut=0.05, use_corrected_pvalue=T, outputfile=NULL, expanded_network_as_signature=FALSE)
#write the result
which(psy_DGCR5_net0.08_kda$keydrivers[,"keydrivers"]=="DGCR5")
write.csv(psy_DGCR5_net0.08_kda$keydrivers,"PsychENCODE_DGCR5_KDA_layer1_weight0.08.csv",row.names=FALSE)
