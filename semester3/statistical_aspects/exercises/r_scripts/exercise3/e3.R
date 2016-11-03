Table = read.table("B3A3_ergometer.dat", header=TRUE, sep="\t", quote="", stringsAsFactor=FALSE)
Table[1,]

# a.) calc age and bmi (age in wich unit?)
for (AgeData in 1:nrow(Table)) {
  age = as.numeric(as.Date(Table[AgeData, "Tday"], format="%m/%d/%Y") - as.Date(Table[AgeData, "Bday"], format="%m/%d/%Y")) / 365.25
  Table[AgeData, 'Age'] = round(age)
  Table[AgeData, 'BMI'] = Table[AgeData, "weight"] / (Table[AgeData, "height"]^2)
}

# b.) determine descriptive statistics for ergometer, lactate, BMI, age seperated by gender