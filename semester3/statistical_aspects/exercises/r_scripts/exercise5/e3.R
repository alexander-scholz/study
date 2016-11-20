a = matrix(data = c(1,0,-2,0,2,0,-2,0,4), nrow = 3, ncol = 3)

# a.)
library('pracma')
charpoly(a) # 1*l^3 -7*l^2 + 10*l + 0
polyroot(c(0,10,-7,1)) # Nullstellen: 0,2,5
polyroot(c(10,-7,1)) # Nullstellen: 2,5

# b.)
eigen(a)

# c.)
x1 = c(2,0,1) / sqrt(5)
x2 = c(-2,0,-2) / sqrt(8)
x3 = c(1,0,-2) / sqrt(5)

round(x1 %*% x3) # 0
round(x1 %*% x2) # -1!!!
round(x2 %*% x3) # 0

# values from eigen()
l1 = c(-0.4472136, 0, 0.8944272)
l2 = c(0,1,0)
l3 = c(0.8944272, 0, -0.4472136)

round(l1 %*% l2) # 0
round(l1 %*% l3) # -1!!!
round(l2 %*% l3) # 0

# d.)
q = matrix(data = c(l1,l2,l3), nrow = 3, ncol = 3)
qi = solve(q)
lam = matrix(data = c(0,0,0,0,2,0,0,0,5), nrow = 3, ncol = 3)
round(q%*%qi)
round(q%*%lam%*%qi) # != a
