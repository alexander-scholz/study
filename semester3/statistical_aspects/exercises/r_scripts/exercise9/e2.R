load('exercise9/B9A2_XYPlots.RData')

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

(mean_allel_a = mean(allel_a))
(mean_allel_b = mean(allel_b))

### von Stefan ###
numbers = vector()
for (i in 1:900){if (i %% 3 != 1){numbers = append(numbers,i)}}
numbers
snpX = vector()
snpY = vector()
for (i in colnames(daten)) {
  if (grepl('X:', i)) {
    snpX = cbind(snpX, as.vector(t(daten[numbers,i])))
  }
  
  if (grepl('Y:', i)) {
    snpY = cbind(snpY, as.vector(t(daten[numbers,i])))
  }
}
dim(snpX)
dim(snpY)
mean_snpX = vector(length = 300)
for (i in 1:300) { mean_snpX[i] = mean(snpX[(2*i):(2*i-1),])}
mean_snpY = vector(length = 300)
for (i in 1:300) { mean_snpY[i] = mean(snpY[(2*i-1):(2*i),])}

# c.)
numbersGeno = vector()
for (i in 1:900){if (i %% 3 == 1){numbersGeno = append(numbersGeno,i)}}
numbersGeno
(genotypes_X_samples = (daten[numbersGeno,1:200]))
freq_geno = matrix(0, nrow = 300, ncol = 3)
for (i in 1:300){
  squik = table(genotypes_X_samples[i,])
  if (names(squik[1]) == "0"){freq_geno[i,1] = squik["0"]}
  if (names(squik[1]) == "1" | names(squik[2]) == "1"){freq_geno[i,2] = squik["1"]}
  if (names(squik[1]) == "2" | names(squik[2]) == "2" | names(squik[3]) == "2"){freq_geno[i,3] = squik["2"]}
}
freq_geno
freq_geno = freq_geno/200
freq_geno
geno_AB = sum(freq_geno[,2])/300
geno_AB
aim_matrix = cbind(samples,mean_snpX,mean_snpY,freq_geno[,2])

interest=which(aim_matrix$mean_snpX>1100)
which(aim_matrix$mean_snpY[interest]>950)
interest[10]

# d.)
plot(aim_matrix$mean_snpX, aim_matrix$mean_snpY)
points(aim_matrix$mean_snpX[aim_matrix$sex_computed == "unknown"], aim_matrix$mean_snpY[aim_matrix$sex_computed == "unknown"], col = "red")

plot(aim_matrix$mean_snpX, aim_matrix$`freq_geno[, 2]`)
points(aim_matrix$mean_snpX[aim_matrix$sex_computed == "unknown"], aim_matrix$`freq_geno[, 2]`[aim_matrix$sex_computed == "unknown"], col = "red")


plot(aim_matrix$mean_snpY, aim_matrix$`freq_geno[, 2]`)
points(aim_matrix$mean_snpY[aim_matrix$sex_computed == "unknown"], aim_matrix$`freq_geno[, 2]`[aim_matrix$sex_computed == "unknown"], col = "red")