data = data.frame(c(125,50,100), c(250,30,500), c(125,20,400))
row.names(data) = c('array1', 'array2', 'array3')
colnames(data) = c('AA', 'AB', 'BB')

# Tabelle mit Allelhäufigkeiten erzeugen und diese dann mit chiq.test()
a=matrix(data=NA,ncol=2,nrow=3)
for (i in 1:3) {
  a[i,] = c(2*data[i,1]+data[i,2], 2*data[i,3]+data[i,2])
}

library(MASS)
# Nullhypothese: Arrays sind statistisch unabhängig
chisq.test(a) # X-squared = 110.0076, df = 2, p-value < 2.2e-16