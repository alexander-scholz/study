data = as.data.frame(cbind(c(1936,1956,1976,1996,2008), c(15,30,50,130,230)))
names(data) = c('year', 'consumption')
data
# y = ln(b*e^(cx)) = ln(b) + ln(e^(cx)) = ln(b) + c*ln(e) * x = ln(b) + c*ln(e) * (x -1900) = 
#
# (ln(b) - c*ln(e)*1900) + c*ln(e) * x
b = 1
c = 1
#plot(data$consumption ~ data$year)
plot(data$consumption ~ ((log(b) - c*log(e)*1900) + (c*log(exp(1)) * data$year)))

lm(data$consumption ~ data$year)