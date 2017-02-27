library(corrplot)
M <- cor(mtcars)
corrplot(M, method="circle")