# 2a
data2 = read.table('B4A2_snp.dat', sep = "\t", header = T)
table(data2[,c(3,4)])
lm_sex = lm(data2$trait ~ data2$sex)
plot(data2$trait ~ data2$sex)
abline(lm_sex, col = 'red')
summary(lm_sex)

lm_snp = lm(data2$trait ~ data2$SNP)
plot(data2$trait ~ data2$SNP)
abline(lm_snp, col = 'red')
summary(lm_snp)

# 2b
lm_multi = lm(data2$trait ~ data2$sex + data2$SNP)
summary(lm_multi)

# 2c: choose lm_sex because less variables and same R² like lm_multi