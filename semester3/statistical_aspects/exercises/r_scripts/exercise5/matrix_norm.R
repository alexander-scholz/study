dat = as.matrix(rbind(c(1, 0.1, -0.1), c(0,2,0.4), c(-0.2,0,3)))

# Spaltensummennorm
norm(dat, type = 'O')

# Zeilensummernnorm
norm(dat, type = 'I')

# Frobeniusnorm
norm(dat, type = 'F')

# 
norm(dat, type = 'M')

# Spektralnorm
norm(dat, type = '2')

# Gesamtnorm = 9