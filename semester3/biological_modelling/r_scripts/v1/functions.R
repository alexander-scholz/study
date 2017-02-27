# linear function
lin_func = function(x, m, n) {
  ((m*x) + n)
}

plot(lin_func(0:10, 1, 0))

# quadratic function
quad_func = function(x, a, b, c) {
  ((a*(x*x)) + (b*x) + c)
}
plot(quad_func(-10:10, 1, 1, 0))