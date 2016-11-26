data = data.frame(c(125,50,100), c(250,30,500), c(125,20,400))
row.names(data) = c('pop1', 'pop2', 'pop3')
colnames(data) = c('AA', 'AB', 'BB')

# a.)
for (i in 1:nrow(data[1])) {
  print(data[i,'AA'])
  print(data[i,'AB'])
  print(data[i,'BB'])
  print(sum(data[i,c(1:3)]))
  data[i,'p'] = (2*data[i,'AA'] + data[i,'AB']) / (2*sum(data[i,c(1:3)]))
  data[i,'q'] = (2*data[i,'BB'] + data[i,'AB']) / (2*sum(data[i,c(1:3)]))
}

p_total = sum(data$p)
q_total = sum(data$q)