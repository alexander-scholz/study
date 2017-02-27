hsb2 <- read.csv("http://www.ats.ucla.edu/stat/data/hsb2.csv")
table(hsb2$race)

hsb2$race.f <- factor(hsb2$race)
is.factor(hsb2$race.f)
hsb2$race.f[1:15]
lm1 = lm(write ~ race.f, data = hsb2)
summary(lm1)
