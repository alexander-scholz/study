data = load('exercise9/B9A2_XYPlots.RData')

#a.)
# Wo stehen die ID?
# die ids stehen in samples$sampleID und in daten in jeder Zeile an erster Stelle

# Wie viele X- bzw. Y-SNPs gibt es?

# Wie viele Männer, wie viele Frauen?
table(samples$sex_datenbank) # female 150  male 150
table(samples$sex_computed)  # female 149  male 145 unknown 6

# b.)
# Mittelwerte
allel_a = vector()
allel_b = vector()
for (i in rownames(daten)) {
  if (grepl(':intA', i)) {
    allel_a = rbind(allel_a, as.vector(t(daten[i,])))
  }
  
  if (grepl(':intB', i)) {
    allel_b = rbind(allel_b, as.vector(t(daten[i,])))
  }
}

mean_allel_a = mean(allel_a)
mean_allel_b = mean(allel_b)

# c.)


# d.)