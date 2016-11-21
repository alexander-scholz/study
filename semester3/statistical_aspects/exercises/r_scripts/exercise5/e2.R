data = read.table('exercise5/B4A2_snp.dat', header = T, sep = '\t')
names(data)

# a.)
tm = median(data$trait)
trait1 = data[data$trait < tm,]
trait2 = data[data$trait > tm,]

t = rep(0, nrow(trait1))
trait1 = cbind(trait1, t)

t = rep(1, nrow(trait2))
trait2 = cbind(trait2, t)

data1 = rbind(trait1, trait2)

# b.)
lm_sex = glm(t ~ sex, data = data1, family = 'binomial')
lm_snp = glm(t ~ SNP, data = data1, family = 'binomial')
# snp hat eigentlich keinen Einfluss, vorher wurder nur die Korrelation gezeigt
lm_multi = glm(t ~ sex + SNP, data = data1, family = 'binomial')
lm_int = glm(t ~ sex*SNP, data = data1, family = 'binomial')

step(lm_int)

# c.)
q_groups = quantile(data$trait)
l25 = q_groups[[2]][1]
l50 = q_groups[[3]][1]
l75 = q_groups[[4]][1]

for (i in 1:length(data1$trait)) {
  value = data1$trait[i]
  #break
  if (value < l25) {
    data1[i,'g4'] = 0
    next
  }
  
  if (value < l50) {
    data1[i,'g4'] = 1
    next
  }
  
  if (value < l75) {
    data1[i,'g4'] = 2
    next
  }
  
  data1[i,'g4'] = 3
}

# d.)
require(MASS)
# Musterlösung ohne method = "probit"!
polr(as.factor(g4) ~ sex, data = data1, method = "probit")
polr(as.factor(g4) ~ SNP, data = data1, method = "probit")
polr(as.factor(g4) ~ sex + SNP, data = data1, method = "probit")
polr(as.factor(g4) ~ sex*SNP, data = data1, method = "probit")

# e.) compared in file aics.csv