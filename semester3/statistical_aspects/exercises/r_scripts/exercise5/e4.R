library('PCAmixdata')

# a.)
data('gironde')
data = gironde$employment
cdata = data[1:200,1:4]

# b.) Orthogonalmatrix berechnen
#orth_mat = qr.Q(qr(cdata))
#orth_mat %*% t(orth_mat) == t(orth_mat) %*% orth_mat
cdata_t = t(cdata)

# z-Transformation
X = (cdata_t - rowMeans(cdata_t)/apply(cdata_t,1,sd))
# A soll Covarianzmatrix sein, dafür fehlt aber noch A/n-1
A = X%*%t(X)

# c.)
eigA = eigen(A)

# d.)
# Eigenwert ist Varianz vom Eigenvektor
eigA$values[1]/sum(eigA$values)

# e.)
myCity = X[,67]
w1 = eigA$vectors[,1]
t(w1)%*%myCity
# oder sum(w1*myCity)

# f.)