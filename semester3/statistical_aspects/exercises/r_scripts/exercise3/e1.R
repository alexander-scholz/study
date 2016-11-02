# plotting: http://www.harding.edu/fmccown/r/
# exercise 1b
se = 0.95
sp = 0.9
p = 0.1

ppw_b = (se * p) / (((1-sp)*(1-p))+(se*p))
ppw_b

npw_b = (sp*(1-p)) / (1-(((1-sp)*(1-p))+(se*p)))
npw_b

# exercise 1c
se = 0.95
sp = 0.9
p = 0.05

ppw_c = (se * p) / (((1-sp)*(1-p))+(se*p))
ppw_c

npw_c = (sp*(1-p)) / (1-(((1-sp)*(1-p))+(se*p)))
npw_c

# exercise 1d
my_func = function(p) {
  se = 0.95
  sp = 0.9
  (se * p) / (((1-sp)*(1-p))+(se*p))
}
p_values = seq(0, 1, 0.025)
plot(my_func(p_values), type="l", xlab="preference values", ylab = "probability for ppw")