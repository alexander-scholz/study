alpha = 0.05
beta = 0
gamma = 88
sigma = 0.25
x_0 = 100
x_1 = 200

p_n_plus_1 = function(n, alpha, beta, gamma, sigma) {
  p_n = 1
  p_n_minus_1 = 0
  (alpha*sigma*gamma*p_n + beta*sigma*sigma*(1-alpha)*gamma*p_n_minus_1)
}

#plot(p_n_plus_1(...))