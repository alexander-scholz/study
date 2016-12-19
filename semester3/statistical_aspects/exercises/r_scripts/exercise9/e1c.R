data = data.frame(c(125,50,100), c(250,30,500), c(125,20,400))
row.names(data) = c('array1', 'array2', 'array3')
colnames(data) = c('AA', 'AB', 'BB')

library(MASS)
chisq.test(data[1:2,]) # p-value = 2.422e-06
chisq.test(data[2:3,]) # p-value < 2.2e-16
chisq.test(data[c(1,3),]) # p-value = 3.087e-16