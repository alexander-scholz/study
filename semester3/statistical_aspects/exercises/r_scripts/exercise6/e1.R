data = data.frame(c(824,1326,463,87))
row.names(data) = c('AA', 'AB', 'BB', 'missing')
colnames(data) = c('dist')
View(data)

# a.) callrate
data$callrate = data$dist/sum(data$dist)

# b.) Allelhäufigkeit
p_a = (2*data['AA','dist'] + data['AB','dist']) / (2*sum(data[-4,'dist']))
p_b = (2*data['BB','dist'] + data['AB','dist']) / (2*sum(data[-4,'dist']))

1 == p_a + p_b

# c.)
1 == (p_a + p_b)^2

AA = p_a^2
AB = 2*p_a*p_b
BB = p_b^2

values = seq(0,1,0.05)
m = matrix(NA, nrow = length(values), ncol = 3, dimnames = list(c(), c('AA', 'AB', 'BB')))
m = as.data.frame(cbind(values, m))

for (v in 1:length(values)) {
  p = values[v]
  q = 1-values[v]
  m[v,'AA'] = p^2
  m[v,'AB'] = 2*p*q
  m[v,'BB'] = q^2
}

plot(AA ~ values, data = m, type = 'b', pch = 0, ylab = '', xlab = '')
points(AB ~ values, data = m, type = 'b', pch = 1)
points(BB ~ values, data = m, type = 'b', pch = 2)
abline(v=p_a, col = 'red')
abline(h=AA, col = 'red')
abline(h=AB, col = 'red')
abline(h=BB, col = 'red')
text(rep(p_a+0.04, 3), c(AA+0.04, AB+0.04, BB+0.04), labels = c('AA', 'AB', 'BB'), col = 'red')

# d.)
n = sum(data[-4,'dist'])
chi2 = ((data['AA', 'dist'] - n * p_a^2)^2/(n * p_a^2)) + ((data['AB', 'dist'] - n * 2 * p_a * p_b)^2/(n * 2 * p_a * p_b)) + ((data['BB', 'dist'] - n * p_b^2)^2/(n * p_b^2))
# https://de.wikipedia.org/wiki/Chi-Quadrat-Test
# chi2 = 3.1415 < 3.84