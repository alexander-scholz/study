library('PCAmixdata')

# a.)
data('gironde')
data = gironde$employment
cdata = data[1:200,1:4]

# b.) Orthogonalmatrix berechnen
orth_mat = qr.Q(qr(cdata))
orth_mat %*% t(orth_mat) == t(orth_mat) %*% orth_mat
