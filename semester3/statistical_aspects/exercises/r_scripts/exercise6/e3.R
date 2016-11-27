data = data.frame(c(49,64,22))
row.names(data) = c('AA', 'AB', 'BB')
colnames(data) = c('count')

# allelfrequenz
p_a = (2*data['AA','count'] + data['AB','count']) / (2*sum(data[,'count']))
p_b = (2*data['BB','count'] + data['AB','count']) / (2*sum(data[,'count']))

# genotypfrequenz
AA = p_a^2
AB = 2*p_a*p_b
BB = p_b^2

F = 1 - (AB/2*p_a*p_b) # 0.9424

CV <- function(x) {
  return(sqrt(var(x))/mean(x))
}

sem = function(x) {
  return(sd(x)/sqrt(length(x)))
}

jacknife_dist = function(x) {
  jack = numeric(length(x)-1)
  pseudo = numeric(length(x))
  
  for (i in 1:length(x)) {
    for (j in 1:length(x)) {
      if(j < i) {
        jack[j] = x[j]
      } else if(j > i) {
        jack[j-1] <- x[j]
      }
    }
    pseudo[i] <- mean(jack)
  }
  return(pseudo)
}

x = c(rep(1,49), rep(2,64), rep(3,22))

x = rnorm(200)
hist(x)
mean(x)
sem(x)

pseu1 = jacknife_dist(x)
mean(pseu1)
sd(pseu1)


# für Daten der Aufgabe
