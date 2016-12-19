data = data.frame(c(125,50,100), c(250,30,500), c(125,20,400))
row.names(data) = c('array1', 'array2', 'array3')
colnames(data) = c('AA', 'AB', 'BB')

library(MASS)
# Nullhypothese: Arrays sind statistisch unabhängig
chisq.test(data[1:2,])    # X-squared = 25.862, df = 2, p-value = 2.422e-06
chisq.test(data[2:3,])    # X-squared = 123.74, df = 2, p-value < 2.2e-16
chisq.test(data[c(1,3),]) # X-squared = 71.429, df = 2, p-value = 3.087e-16

chisq.test(data) # X-squared = 146.36, df = 4, p-value < 2.2e-16

# https://de.wikipedia.org/wiki/Chi-Quadrat-Test
0.5*10^(-(25.862/5.9915)) # 2.412802e-05
0.5*10^(-(25.862/4.6025)) # 1.201849e-06