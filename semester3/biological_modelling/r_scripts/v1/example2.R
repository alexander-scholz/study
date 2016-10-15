own_func = function(c, lambda, n) {
  return (c*lambda^n)
}

n = 0:80
data = own_func(1, 1.15, n)
plot(n, data, col = 'black')
lines(n, data, col = 'black')

data = own_func(1, 0.5, n)
plot(n, data, col = 'red')
lines(n, data, col = 'red')

data = own_func(1, -0.9, n)
plot(n, data, col = 'green')
lines(n, data, col = 'green')

data = own_func(1, -1.1, n)
plot(n, data, col = 'blue')
lines(n, data, col = 'blue')