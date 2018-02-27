##Descrption: Limma for RNA-seq (from fastq to DEG), Ref from http://bioinf.wehi.edu.au/RNAseqCaseStudy/
##Author: WKL
##Date: 20180226
##Envrionment: R3.3

#Demo data
# wget http://bioinf.wehi.edu.au/RNAseqCaseStudy/data.tar.gz

#install libraries
source("http://bioconductor.org/biocLite.R")
biocLite(pkgs = c("Rsubread","limma","edgeR"))

#Load libraries
library(Rsubread)
library(limma)
library(edgeR)
options(digits=2)

#Read in names of FASTQ files and create a design matrix.
targets <- readTargets()
celltype <- factor(targets$CellType)
design <- model.matrix(~celltype)
targets

##fastq to count, could use other tools
#Index building
buildindex(basename="chr1",reference="hg19_chr1.fa")
#Alignment
align(index="chr1",readfile1=targets$InputFile,input_format="gzFASTQ",output_format="BAM", output_file=targets$OutputFile,unique=TRUE,indels=5)
#Read summarization
fc <- featureCounts(files=targets$OutputFile,annot.inbuilt="hg19")
x <- DGEList(counts=fc$counts, genes=fc$annotation[,c("GeneID","Length")])
#RPKM values 
x_rpkm <- rpkm(x,x$genes$Length)

#Filtering
isexpr <- rowSums(cpm(x) > 10) >= 2
x <- x[isexpr,]

#Normalization
y <- voom(x,design,plot=TRUE)

#Sample clustering
plotMDS(y,xlim=c(-2.5,2.5))

#Linear model fitting and differential expression analysis
fit <- eBayes(lmFit(y,design))
topTable(fit,coef=2)
