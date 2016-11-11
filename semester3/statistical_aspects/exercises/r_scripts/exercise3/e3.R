require(plotrix)

Table = read.table("B3A3_ergometer.dat", header=TRUE, sep="\t", quote="", stringsAsFactor=FALSE)

# a.) calc age and bmi (age in wich unit?)
for (AgeData in 1:nrow(Table)) {
  age = as.numeric(as.Date(Table[AgeData, "Tday"], format="%m/%d/%Y") - as.Date(Table[AgeData, "Bday"], format="%m/%d/%Y")) / 365.25
  Table[AgeData, 'Age'] = round(age)
  Table[AgeData, 'BMI'] = Table[AgeData, "weight"] / (Table[AgeData, "height"]^2)
}
rm(age)

# b.) determine descriptive statistics for ergometer, lactatee, BMI, age seperated by gender
# https://de.wikibooks.org/wiki/GNU_R:_Deskriptive_Statistik
ergo_m = Table[Table[,'sex'] == 1,"ergometer"]
ergo_f = Table[Table[,'sex'] == 2,"ergometer"]
lactate_m = Table[Table[,'sex'] == 1, "lactate"]
lactate_f = Table[Table[,'sex'] == 2, "lactate"]
bmi_m = Table[Table[,'sex'] == 1, "BMI"]
bmi_f = Table[Table[,'sex'] == 2, "BMI"]
age_m = Table[Table[,'sex'] == 1, "Age"]
age_f = Table[Table[,'sex'] == 2, "Age"]

### functions ###
varianz <- function(x) {n=length(x) ; var(x) * (n-1) / n}
stdabw <- function(x) {n=length(x) ; sqrt(var(x) * (n-1) / n)}
print_desc_data = function(x, desc = 'Description of Dataset') {
  print(desc)
  print('mean')
  print(mean(x))
  print('quantiles')
  print(quantile(x, seq(0, by = 0.1)))
  print('range')
  print(diff(range(x)))
  print('variance')
  print(var(x))
  print(varianz(x))
  print('standard deviation')
  print(sd(x))
  print(stdabw(x))
}

ref_names = c('male', 'female')
ref_col = col = c('blue', 'red')

### ergo data ###
print_desc_data(ergo_m, 'male ergo data')
print_desc_data(ergo_f, 'female ergo data')
multhist(list(ergo_m, ergo_f), main = 'ergo male vs. female', names = ref_names, col = ref_col)
legend(15, 30, ref_names, lty = c(1,1), lwd=c(2.5,2.5), col=c('blue','red'))

### lactate data ###
print_desc_data(lactate_m, 'male lactate data')
print_desc_data(lactate_f, 'female lactate data')
multhist(list(lactate_m, lactate_f), main = 'lactate male vs. female', names = ref_names, col = ref_col)
legend(15, 30, ref_names, lty = c(1,1), lwd=c(2.5,2.5), col=c('blue','red'))

### bmi ###
print_desc_data(bmi_m, 'male bmi data')
print_desc_data(bmi_f, 'female bmi data')
multhist(list(bmi_m, bmi_f), main = 'bmi male vs. female', names = ref_names, col = ref_col)
legend(15, 30, ref_names, lty = c(1,1), lwd=c(2.5,2.5), col=c('blue','red'))

### age ###
print_desc_data(age_m, 'male age data')
print_desc_data(age_f, 'female age data')
multhist(list(age_m, age_f), main = 'age male vs. female', names = ref_names, col = ref_col)
legend(15, 30, ref_names, lty = c(1,1), lwd=c(2.5,2.5), col=c('blue','red'))

# c.) compare ergo for genders with adapted test
# two independent variables, distribution unknown -> wilcox-test
# https://de.wikibooks.org/wiki/GNU_R:_wilcox_test
gender = Table[,'sex']
gender[gender==1] = 'm'
gender[gender==2] = 'w'
ergometer = Table[,'ergometer']
ergo_data = data.frame(gender, ergometer)
colnames(ergo_data) = c('gender', 'ergometer')
wilcox.test(ergometer~gender, data = ergo_data)

# Test auf Normalverteilung
# shapiro.test()

# d.) correlate ergo with lactate, bmi and age
ergometer = Table[,'ergometer']
lactate = Table[,'lactate']
bmi = Table[,'BMI']
age = Table[,'Age']
data_set = data.frame(ergometer, lactate, bmi, age)

library(corrplot)
correlation_data = cor(data_set)
corrplot(correlation_data, method="circle")

# Ergebnis: BMI korreliert nicht mit Ergo, da schon normiert auf Gewicht