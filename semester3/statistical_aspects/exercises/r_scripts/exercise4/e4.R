data = read.table('B4A4_haendigkeit.dat', header = T)

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
data = data[!is.na(data$WrHnd)]
nrow(data)
