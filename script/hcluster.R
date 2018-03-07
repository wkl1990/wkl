##Description: Hierarchical Clustering
##Author: WKL
##Date: 20180228
##Environment: R3.3

#WGCNA hcluster (include scale)
hc = hclust(dist(datat), method = "average");
hc1 = hclust(dist(scale(datat)), method = "average");
hcd = as.dendrogram(hc)
#sizeGrWindow(12,9)
#pdf(file = "Plots/sampleClustering.pdf", width = 12, height = 9);
par(cex = 0.6);
par(mar = c(0,4,2,0))
plot(hc, main = "Sample cluster", sub="", xlab="", cex.lab = 1.5, cex.axis = 1.5, cex.main = 2, hang = -1) #hang could remove
#dev.off()

#Add color based on the cluster result(http://rpubs.com/gaston/dendrograms)
labelColors = c("#CDB380", "#036564", "#EB6841", "#EDC951")
# cut dendrogram in 4 clusters
clusMember = cutree(hc, 4)
# function to get color labels
colLab <- function(n) {
    if (is.leaf(n)) {
        a <- attributes(n)
        labCol <- labelColors[clusMember[which(names(clusMember) == a$label)]]
        attr(n, "nodePar") <- c(a$nodePar, lab.col = labCol)
    }
    n
}
# using dendrapply
clusDendro = dendrapply(hcd, colLab)
# make plot
plot(clusDendro, main = "Cool Dendrogram")


#Add color based on the sample information
labelColors = c("red", "blue")
clusMember = c(rep(1,75),rep(2,75)) #adjust based on sample info.
names(clusMember) = hc$labels
colLab <- function(n) {
    if (is.leaf(n)) {
        a <- attributes(n)
        labCol <- labelColors[clusMember[which(names(clusMember) == a$label)]]
        attr(n, "nodePar") <- c(a$nodePar, lab.col = labCol)
    }
    n
}
clusDendro = dendrapply(hcd, colLab)
plot(clusDendro, main = "Cool Dendrogram")
# legend("topright",legend = c("non-outliers","outliers"), col=labelColors,pch=19,cex=.7)

#hcluster and trait heatmap
library(WGCNA)
sampleTree = hclust(dist(t(data)), method = "average")
#Convert traits to a color representation: white means low, red means high, grey means missing entry
traitColors = numbers2colors(trait, signed = FALSE);
# Plot the sample dendrogram and the colors underneath.
plotDendroAndColors(sampleTree, traitColors, groupLabels = names(trait), main = "Samples dendrogram and trait heatmap")
