data = data.frame(c(49,64,22))
row.names(data) = c('AA', 'AB', 'BB')
colnames(data) = c('count')

mean(data[,'count'])
sem(data[,'count'])
# allelfrequenz
p_a = (2*data['AA','count'] + data['AB','count']) / (2*sum(data[,'count']))
p_b = (2*data['BB','count'] + data['AB','count']) / (2*sum(data[,'count']))

# genotypfrequenz
AA = p_a^2
AB = 2*p_a*p_b
BB = p_b^2

F = 1 - (AB/2*p_a*p_b) # 0.9424

### part b ###

CV <- function(x) {
  return(sqrt(var(x))/mean(x))
}

sem = function(x) {
  return(sd(x)/sqrt(length(x)))
}

jacknife_dist_mean = function(x) {
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

# random data
x = rnorm(200)
hist(x)
mean(x)
sem(x)

jkd1 = jacknife_dist_mean(x)
mean(jkd1)
sd(jkd1)

### data from exercise ###
jacknife_dist_f = function(x) {
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
    pseudo[i] <- calc_f(jack)
  }
  return(pseudo)
}

calc_f = function(data) {
  # make tmp table from input data
  tmp_data = as.data.frame(c(length(which(x==1)), length(which(x==2)), length(which(x==3))))
  row.names(tmp_data) = c('AA', 'AB', 'BB')
  colnames(tmp_data) = c('count')
  
  # allelfrequenz
  p_a = (2*tmp_data['AA','count'] + tmp_data['AB','count']) / (2*sum(tmp_data[,'count']))
  p_b = (2*tmp_data['BB','count'] + tmp_data['AB','count']) / (2*sum(tmp_data[,'count']))
  
  # genotypfrequenz
  AA = p_a^2
  AB = 2*p_a*p_b
  BB = p_b^2
  
  F = 1 - (AB/2*p_a*p_b)
  return(F)
}

x = c(rep(1,49), rep(2,64), rep(3,22))
jkd2 = jacknife_dist_f(x)
sd(jkd2)