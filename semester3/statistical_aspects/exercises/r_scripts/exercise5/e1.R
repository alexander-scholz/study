data = read.table('exercise5/tabelle.csv', sep = '\t', header = T, dec = ',')
data = data[2:11,]
row.names(data) = c(1:10)
names(data) = c('c', 'v_adult', 'v_embryo')
data = as.data.frame(data)

### adult ###
nls(v_adult ~ vmax*c/(c + km), data = data, start = c('vmax' = 10, 'km' = 5))

x = seq(1,30,1)
y = 20.04*x/(x + 30.09)
plot(data$v_adult ~ data$c, main = 'adult')
lines(y ~ x, col = 'red')

### embryo ###
nls(v_embryo ~ vmax*c/(c + km), data = data, start = c('vmax' = 10, 'km' = 5))

x2 = seq(1,30,1)
y2 = 19.977*x2/(x2 + 4.988)
plot(data$v_embryo ~ data$c)
lines(y2 ~ x2, col = 'red')

plot(data$v_adult ~ data$c, ylim = c(0,20), ylab='v', xlab='c')
lines(y ~ x, col = 'red')
points(data$v_embryo ~ data$c)
lines(y2 ~ x2, col = 'blue')

# conclusion: Substrataffinität ist höher bei Embryo