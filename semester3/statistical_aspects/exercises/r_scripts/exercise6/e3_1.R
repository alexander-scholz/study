data = rbind(c(49,64,22), c(48,64,22), c(49,63,22), c(49,64,21))
colnames(data) = c('AA', 'AB', 'BB')
row.names(data) = c('1', '2', '3', '4')

p_a_hw = (2*data[1, 'AA'] + data[1, 'AB']) / (2*sum(data[1,]))
p_b_hw = (2*data[1, 'BB'] + data[1, 'AB']) / (2*sum(data[1,]))

AA = p_a_hw^2
AB = 2*p_a_hw*p_b_hw
BB = p_b_hw^2

F_hw = 1 - (AB/(2*p_a_hw*p_b_hw))
# F_hw = 0.012

for (i in 2:length(data[,1])) {
  p_a = (2*data[i, 'AA'] + data[i, 'AB']) / (2*sum(data[i,]))
  p_b = (2*data[i, 'BB'] + data[i, 'AB']) / (2*sum(data[i,]))
  F = 1 - (2*p_a*p_b/2*p_a_hw*p_b_hw)
}