data = as.data.frame(cbind(c(1936,1956,1976,1996,2008), c(15,30,50,130,230)))
names(data) = c('year', 'consumption')
data

# y = ln(b*e^(cx)) = ln(b) + ln(e^(cx)) = ln(b) + c*ln(e) * x = ln(b) + c*ln(e) * (x -1900) = 
#
# (ln(b) - c*ln(e)*1900) + c*ln(e) * x
#b = 1
#c = 1
#plot(log(data$consumption) ~ ((log(b) - c*log(e)*1900) + (c*log(exp(1)) * data$year)))

# linear
plot(data$consumption ~ data$year)
lines(data$consumption ~ data$year)

# a.) log
###############################
# without correction (x-1900) #
###############################
plot(log(data$consumption) ~ log(data$year))
lines(log(data$consumption) ~ log(data$year))

mylm_uc = lm(log(data$consumption) ~ log(data$year))
abline(mylm_uc, col = 'red')

mylm_uc_coef = coef(mylm_uc)
# for cx + b:
names(mylm_uc_coef) = c('b', 'c')

#############################
# with corrections (x-1900) #
#############################
corr_data = data
corr_data$year = corr_data$year - 1900
plot(log(corr_data$consumption) ~ log(corr_data$year))
lines(log(corr_data$consumption) ~ log(corr_data$year))

mylm_c = lm(log(corr_data$consumption) ~ log(corr_data$year))
abline(mylm_c, col = 'red')

mylm_c_coef = coef(mylm_c)
# for cx + b:
names(mylm_c_coef) = c('b', 'c')

# b.)
get_value = function(mycoef, year) {
  return(mycoef['b'] + mycoef['c']*log(year))
}

# uncorrected
res_uc = get_value(mylm_uc_coef, 2010)
exp(res_uc)
res_uc = get_value(mylm_uc_coef, 2010)
exp(res_uc)

# corrected
res_c = get_value(mylm_c_coef, 2010)
exp(res_c)

exp(get_value(mylm_c_coef, 2008))

# c.)

lin_data = as.data.frame(seq(1930,2030,1))
names(lin_data) = c('year')

for (i in 1:nrow(lin_data)) {
  lin_data[i,'consumption'] = get_value(mylm_uc_coef, lin_data[i,'year'])
  lin_data[i,'consumption_exp'] = exp(get_value(mylm_uc_coef, lin_data[i,'year']))
}

# lin plot
plot(consumption ~ year, data = lin_data)
lines(consumption ~ year, data = lin_data)

# exp plot
plot(consumption_exp ~ year, data = lin_data)
lines(consumption_exp ~ year, data = lin_data)