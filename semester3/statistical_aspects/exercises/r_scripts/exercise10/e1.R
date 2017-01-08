library(qqman)
data('gwasResults')

# a.)
# qq-plot with p-values
qq(gwasResults$P)

# Inflationsfaktor λ
ysq_dist = qchisq(gwasResults$P, df = 1)
lambda = median(ysq_dist)/0.456 # 0.9891169

# b.)
# da λ=0.9891169 < 1.05 -> keine Korrektur notwendig
# trotzdem mal ausprobieren:
xsq = ysq_dist/lambda
p_values = pchisq(xsq, df = 1)
qq(p_values)

# c.)
manhattan(
  gwasResults,
  col = c(seq(1,8)),
  suggestiveline = F,
  genomewideline = F
)
# suggestiveline
abline(h=-log10(1e-06), col = c('red'), lty = 2)
# genomewideline
abline(h=-log10(5e-08), col = c('red'))

# d.)
# from https://www.ebi.ac.uk/gwas: http://europepmc.org/abstract/MED/19198612
# 2009, coronary artery disease
# (http://www.deutschlandfunk.de/programmierte-gefahr-aus-den-genen.676.de.html?dram:article_id=26167)