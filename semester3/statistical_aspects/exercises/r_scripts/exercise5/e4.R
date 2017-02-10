library('PCAmixdata')

# a.)
data('gironde')
cdata = gironde$employment[1:200,1:4]

# b.) Orthogonalmatrix berechnen
# z-Transformation
X = scale(cdata)
colnames(X) = NULL
row.names(X) = NULL
X_t = t(X)
# A soll Covarianzmatrix sein, dafür fehlt aber noch A/n
# warum transponiert*normal?
A = X_t %*% X
det(A)

# c.)
eigA = eigen(A)

# d.)
# Eigenwert ist Varianz vom Eigenvektor
eigA$values[1]/sum(eigA$values)

# e.)
myCity = X_t[,67]
# warum benutzen wir nur die ersten beiden eigenvektoren?
w1 = eigA$vectors[,1]
w2 = eigA$vectors[,2]
myCity%*%w1
myCity%*%w2
# oder sum(w1*myCity)

# f.)
x = as.numeric(X%*%w1)
y = as.numeric(X%*%w2)
# Lösung ist gespiegelt, Eigenwerte enthalten schon gespiegelte Einenvektoren!
plot(x,y,pch=19)
points(x[67],y[67],pch=21,col="red")
