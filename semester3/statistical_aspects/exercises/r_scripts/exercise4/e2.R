# 2a
data2 = read.table('exercise4/B4A2_snp.dat', sep = "\t", header = T)
table(data2[,c(3,4)])
lm_sex = lm(data2$trait ~ data2$sex)
plot(data2$trait ~ data2$sex)
abline(lm_sex, col = 'red')
summary(lm_sex)
# AIC -> find min
AIC(lm_sex)

# or loglike -> find min
logLik(lm_sex)

lm_snp = lm(data2$trait ~ data2$SNP)
plot(data2$trait ~ data2$SNP)
abline(lm_snp, col = 'red')
summary(lm_snp)
AIC(lm_snp)
# 2b
lm_multi = lm(data2$trait ~ data2$sex + data2$SNP)
summary(lm_multi)
AIC(lm_multi)
# interaction trait=sex + snp + sex*snp
lm_multi_interact = lm(data2$trait ~ (data2$sex * data2$SNP))
plot(data2$trait ~ (data2$sex * data2$SNP))
summary(lm_multi_interact)
AIC(lm_multi_interact)

# best solution -> plot interaction plot
interaction.plot(data2$sex, data2$SNP, data2$trait)