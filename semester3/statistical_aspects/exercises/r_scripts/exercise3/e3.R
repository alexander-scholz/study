require(plotrix)

Table = read.table("B3A3_ergometer.dat", header=TRUE, sep="\t", quote="", stringsAsFactor=FALSE)
Table[1,]

# a.) calc age and bmi (age in wich unit?)
for (AgeData in 1:nrow(Table)) {
  age = as.numeric(as.Date(Table[AgeData, "Tday"], format="%m/%d/%Y") - as.Date(Table[AgeData, "Bday"], format="%m/%d/%Y")) / 365.25
  Table[AgeData, 'Age'] = round(age)
  Table[AgeData, 'BMI'] = Table[AgeData, "weight"] / (Table[AgeData, "height"]^2)
}

# b.) determine descriptive statistics for ergometer, lactate, BMI, age seperated by gender
# https://de.wikibooks.org/wiki/GNU_R:_Deskriptive_Statistik
ergo_m = Table[Table[,'sex'] == 1,"ergometer"]
ergo_f = Table[Table[,'sex'] == 2,"ergometer"]
lactat_m = Table[Table[,'sex'] == 1, "lactate"]
lactat_f = Table[Table[,'sex'] == 2, "lactate"]
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
multhist(list(ergo_m, ergo_f), names = ref_names, col = ref_col)
legend(15, 30, ref_names, lty = c(1,1), lwd=c(2.5,2.5), col=c('blue','red'))

### lactat data ###


### bmi ###


### age ###
