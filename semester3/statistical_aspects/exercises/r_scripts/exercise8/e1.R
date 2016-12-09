rel_data = read.csv('exercise8/B8A1_reliability.dat', header = T, sep = ' ')

# a.)
# using package cccrm
require(cccrm)

data(bpres)
newdat=bpres[bpres$NM==1,]
estccc=cccvc(newdat,"DIA","ID","METODE")
estccc
summary(estccc)

# exercise data
new_data = cbind(rel_data$id, rel_data$trait_1, rep(1,100))
tmp_data = cbind(rel_data$id, rel_data$trait_2, rep(2,100))
e1a_data = rbind(new_data, tmp_data)
colnames(e1a_data) = c('id', 'trait', 'method')
ccc_ea1 = cccvc(e1a_data, 'trait', 'id', 'method')
ccc_ea1

means = (rel_data$trait_1 + rel_data$trait_2)/2
diffs = rel_data$trait_1 - rel_data$trait_2
m_diffs = mean(diffs)
sd_diffs = 1.96*sd(diffs)
plot(diffs ~ means)
abline(h = m_diffs, col = 'blue')
text('MEAN:', x = 5, y = m_diffs+0.1, col = 'blue', cex = 0.75)
text(m_diffs, x = 5, y = m_diffs-0.1, col = 'blue', cex = 0.75)
abline(h = m_diffs + sd_diffs, col = 'red')
text('+1.96SD', x = 5, y = m_diffs + sd_diffs + 0.1, col = 'red', cex = 0.75)
text(m_diffs + sd_diffs, x = 5, y = m_diffs + sd_diffs - 0.1, col = 'red', cex = 0.75)
abline(h = m_diffs - sd_diffs, col = 'red')
text('-1.96SD', x = 5, y = m_diffs - sd_diffs + 0.1, col = 'red', cex = 0.75)
text(m_diffs - sd_diffs, x = 5, y = m_diffs - sd_diffs - 0.1, col = 'red', cex = 0.75)

# b.)