data = as.data.frame(read.table('exercise4/B4A4_haendigkeit.dat', header = T))

# a.)
dim(data)
names(data)

# sex [1=male, 2=female]
table(data$sex)

# WrHnd: lenght writing hand [cm]
range(data$WrHnd, na.rm = T)
hist(data$WrHnd, breaks = 20)
boxplot(data$WrHnd)

# NWHnd: lenght non writing hand [cm]
range(data$NWHnd, na.rm = T)
hist(data$NWHnd, breaks = 20)
boxplot(data$NWHnd)

# Whnd: wrintinghand [0=right, 1=left]
table(data$WHnd)

# Fold: preference for armfolding [0=right to left, 0.5=no, 1=left to right]
table(data$Fold)

# Clap: preference for clapping [0=right, 0.5=no, 1=left]
table(data$Clap)

# height: bodyheight [m]
range(data$height*100, na.rm = T)
hist(data$height*100, breaks = 20)
#line(density(data$height[!is.na(data$height)]*100))

# b.)
which(is.na(data$WrHnd))
which(is.na(data$NWHnd))
nrow(data)
# remove NA data rows
data_cleaned = data[!is.na(data$WrHnd) | !is.na(data$NWHnd),]
hist(data_cleaned$WrHnd, breaks = 30)
hist(data_cleaned$NWHnd, breaks = 30)
mean(data_cleaned$WrHnd)
median(data_cleaned$WrHnd)
mean(data_cleaned$NWHnd)
median(data_cleaned$NWHnd)
box = boxplot(data_cleaned$WrHnd, data_cleaned$NWHnd, axis = F)
axis(1, at = c(1,2), labels = c('WrHnd', 'NWHnd'))
box$stats

# c.)
hl_male = c(data_cleaned[data_cleaned$sex==1,'WrHnd'], data_cleaned[data_cleaned$sex==1,'NWHnd'])
hl_male = hl_male[!is.na(hl_male)]
mean(hl_male)
hl_female = c(data_cleaned[data_cleaned$sex==2,'WrHnd'], data_cleaned[data_cleaned$sex==2,'NWHnd'])
hl_female = hl_female[!is.na(hl_female)]
mean(hl_female)
wilcox.test(hl_male, hl_female, alternative = "two.sided")
ks.test(hl_male, hl_female, alternative = 'two.sided')

# d.)
# male
wilcox.test(data_cleaned[data_cleaned$sex==1,'WrHnd'], data_cleaned[data_cleaned$sex==1,'NWHnd'], alternative = 'two.sided')
ks.test(data_cleaned[data_cleaned$sex==1,'WrHnd'], data_cleaned[data_cleaned$sex==1,'NWHnd'], alternative = 'two.sided')
# female
wilcox.test(data_cleaned[data_cleaned$sex==2,'WrHnd'], data_cleaned[data_cleaned$sex==2,'NWHnd'], alternative = 'two.sided')
ks.test(data_cleaned[data_cleaned$sex==2,'WrHnd'], data_cleaned[data_cleaned$sex==2,'NWHnd'], alternative = 'two.sided')

# e.)
data_e_cleaned = data_cleaned[data_cleaned$Fold!=0.5 & data_cleaned$Clap!=0.5, c('WHnd', 'Fold', 'Clap')]
library(corrplot)
correlation_data = cor(data_e_cleaned)
corrplot(correlation_data, method="circle")


  