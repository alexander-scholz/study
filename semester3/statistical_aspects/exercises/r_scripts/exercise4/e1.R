# exercise 1b
data1 = as.data.frame(cbind(c(180,170,190),c(80,60,85)))
names(data1) = c('height', 'weight')
data1
lm1 = lm(data1$weight ~ data1$height)

plot(data1$weight ~ data1$height)
abline(lm1, col = "red")
myvar = var(data1$height)
mycov = cov(data1$height, data1$weight)
1.25 == mycov / myvar

coefficients(lm1)
b0 = -150.00
b1 = 1.25

# 1c
x = 176
y = -150 + 1.25*176

# 1d
#y = b0 + b1 * Größe + b2 * Alter + b3 * Geschlecht + Fehler
#lm1 = lm(data1$weight ~ data1$height + )