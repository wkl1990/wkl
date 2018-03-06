##Description: From rsem to TPM_matrix and FPKM_matrix
##Author: WKL
##Data: 2018/03/06
##Environment: python3.6
##Input
##Output

#package import
import re
import time 
import os
# import gzip
from collections import OrderedDict
#calculate time
start = time.clock()

#change directory
path = "./"
os.chdir(path)

#init the variables
TPM_matrix = OrderedDict()
FPKM_matrix = OrderedDict()

#read the files
# pathnames = os.listdir()
filenames = []
with open("RNAseq_sample.txt",'rt') as f:
	for line in f:
		line = line.rstrip()
		if line:
			filenames.append(line)

#reorganize the FPKM and TPM matrix
for filename in filenames:
	sampleID = filename.split("/")[-1].split(".")[0]
	if "sample" not in FPKM_matrix:
		TPM_matrix["sample"] = str(sampleID)
		FPKM_matrix["sample"] = str(sampleID)
	else:
		TPM_matrix["sample"] += ("\t" + str(sampleID))
		FPKM_matrix["sample"] += ("\t" + str(sampleID))
	with open(filename, 'rt') as fp:
		#print(filename)
		for line in fp:
			genename = line.rstrip().split("\t")[0]
			if genename.startswith("gene_id"):
				continue
			geneTPM = line.rstrip().split("\t")[5]
			geneFPKM = line.rstrip().split("\t")[6]
			if genename in TPM_matrix:
				TPM_matrix[genename] += ("\t" + str(geneTPM))
				FPKM_matrix[genename] += ("\t" + str(geneFPKM))
			else:
				TPM_matrix[genename] = str(geneTPM)
				FPKM_matrix[genename] = str(geneFPKM) 

#write the file
with open("xiangya_20180306_TPM_matrix.txt", 'w') as fp_out:
	for genename, geneTPM in TPM_matrix.items():
		fp_out.write("\t".join([genename, geneTPM]) + "\n")

with open("xiangya_20180306_FPKM_matrix.txt", 'w') as fp_out:
        for genename, geneFPKM in FPKM_matrix.items():
                fp_out.write("\t".join([genename, geneFPKM]) + "\n")

end = time.clock()
print("used %s s" % str(end - start))

