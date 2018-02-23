##Description: To find the definite gene expression in some sample such as brain and blood.
##Author: WKL
##Date: 2018/02/23
##Environment: R3.2

options(stringsAsFactors=FALSE)
setwd("/zs32/data-analysis/liucy_group/dbGAP_phs000833_SingleNeuron/dbGAP_10683/files")

#read sample information
sample <- read.table(gzfile("phs000424.v7.pht002743.v7.p2.c1.GTEx_Sample_Attributes.GRU.txt.gz"),fill=TRUE,sep="\t",quote="\"",header=TRUE)
dim(sample) #[1] 15598    75
#get the whole blood sample
sample_blood <- sample[sample$SMTSD=="Whole Blood" & sample$SMAFRZE=="RNASEQ",]
dim(sample_blood) #[1] 407  75
sample_blood_id <- gsub("-",".",sample_blood$SAMPID)
#get the frontal cortex sample
sample_fc <- sample[sample$SMTSD=="Brain - Frontal Cortex (BA9)" & sample$SMAFRZE=="RNASEQ",]
dim(sample_fc) #[1] 129  75
sample_fc_id <- gsub("-",".",sample_fc$SAMPID)
#read the fpkm
rpkm <- read.table(gzfile("./phe000020.v1.GTEx_RNAseq.expression-data-matrixfmt.c1/GTEx_Data_20160115_v7_RNAseq_RNASeQCv1.1.8_gene_rpkm.gct.gz"),header=TRUE,row.names=1,skip=2)
dim(rpkm) #[1] 56202 12768
#get the blood and fc expression data
rpkm_blood <- rpkm[,c("Description",sample_blood_id)]
dim(rpkm_blood) #[1] 56202   408
rpkm_fc <- rpkm[,c("Description",sample_fc_id)]
dim(rpkm_fc) #[1] 56202   130
#read the gene list
library(xlsx)
geneid <- read.xlsx("~/tmp/ck-gene list.xlsx",sheetName = "Sheet1",header=FALSE)
rpkm_blood$ensem <- rownames(rpkm_blood)
rpkm_blood$ensem <- as.character((lapply(strsplit(rpkm_blood$ensem,"\\."),function(x) as.character(x[[1]][1]))))
rpkm_blood_id <- rpkm_blood[which(rpkm_blood$ensem %in% geneid$X2),]
rpkm_blood_id$id <- geneid$X1[match(rpkm_blood_id$ensem,geneid$X2)]
write.csv(rpkm_blood_id,file="~/tmp/CKgene_Blood_rpkm.csv")

rpkm_fc$ensem <- rownames(rpkm_fc)
rpkm_fc$ensem <- as.character((lapply(strsplit(rpkm_fc$ensem,"\\."),function(x) as.character(x[[1]][1]))))
rpkm_fc_id <- rpkm_fc[which(rpkm_fc$ensem %in% geneid$X2),]
rpkm_fc_id$id <- geneid$X1[match(rpkm_fc_id$ensem,geneid$X2)]
write.csv(rpkm_fc_id,file="~/tmp/CKgene_FC_rpkm.csv")




