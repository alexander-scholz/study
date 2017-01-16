# install lumi with bioconductor
# source("https://bioconductor.org/biocLite.R")
# biocLite("lumi")

Barnes="B11A2_Barnes_gene_profile.txt"
sampleInfo="B11A2_sampleInfo.txt"

myDat1 = lumiR(Barnes, lib.mapping='lumiHumanIDMapping',
               QC=F, convertNuID=F)
dim(myDat1)

myDat2 = lumiR(Barnes, lib.mapping='lumiHumanIDMapping',
               QC=T, convertNuID=F)
dim(myDat2)

# bei batch ist phaenotyp dabei
myDat3 = lumiR.batch(Barnes, lib.mapping='lumiHumanIDMapping',
                     QC=F, convertNuID=F, sampleInfoFile= sampleInfo)
dim(myDat3)

myDat4 = lumiR.batch(Barnes, lib.mapping='lumiHumanIDMapping',
                     QC=T, convertNuID=F, sampleInfoFile= sampleInfo)

# 4.)
prob_data = pData(myDat3)
exprs_data = exprs(myDat3)
detection_data = detection(myDat3)

write.table(prob_data, 'prob_data.txt', sep='\t', quote=, row.names=F)
write.table(exprs_data, 'exprs_data.txt', sep='\t', quote=, row.names=F)
write.table(detection_data, 'detection_data.txt', sep='\t', quote=, row.names=F)

# 5.)
data(example.lumi)
myDat5=example.lumi
dim(myDat5)
summary(myDat5)

myDat_bgqc = lumiB(myDat5)
summary(myDat_bgqc, 'QC')

matplot(exprs(myDat5), exprs(myDat_bgqc), type='p',
        main="compare log2 transform", xlab="...", ylab="...")
abline(0,1,col="red")

# hat korrektur was gemacht?
max(as.vector(exprs(myDat5)-exprs(myDat_bgqc)))

# Varianzstabilisierung
myDat5_var = lumiT(myDat5, method='log2')
myDat5_var_quan=lumiN(myDat5_var)

matplot(myDat5, myDat5_var_quan, type='p',
        main="compare log2 transform",
        xlab="before correction", ylab="after log2 and quantile-correction")

mydat5_dat = detection(myDat5)
head(mydat5_dat)
dim(mydat5_dat)
A01 = mydat5_dat[mydat5_dat[,1]<0.05]

A02 = mydat5_det[mydat5_det[,'A02']<0.05]
