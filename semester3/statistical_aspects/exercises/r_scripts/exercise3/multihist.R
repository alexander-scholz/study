require(plotrix)
dat <- rnorm(1000)
extra_dat <- rnorm(1000)
#Plot
plot(hist(dat),col="blue")
lines(hist(extra_dat),col="red")
multhist(list(dat, extra_dat))

plot(
  c(1968,2010), 
  c(0,10),
  type='n',
  xlab='Year',
  ylab='Expenditures/GDP (%)'
)
lines(year,defense,col='red',lwd=2.5)
lines(year,health,col='blue',lwd=2.5)
legend(2000, 9.5, lty=c(1,1), lwd=c(2.5,2.5), col=c('blue','red'))