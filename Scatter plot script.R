dir()

tmp<- read.csv("DH5 LBC6vsLBT6 and LBC12vsLBT12 for scatter plot.csv")
Genes <- tmp[complete.cases(tmp),]

hist(Genes$DH5_M9C6vsM9T6)
hist(Genes$DH5_M9C6vsM9T6, breaks=50, col="lightblue")

A<- Genes$M15_LBC6vsLBT6, breaks=50, col="lightblue"

hist(Genes$T7vsC7.Log2Foldchange, breaks=100,col="lightblue")

head(Genes)
plot(Genes$DH5_LBC6vsLBT6, Genes$DH5_LBC12vsLBT12, col="blue",
     pch=3)
abline(v=med1, col="red")

library("gplots")
mat <- matrix(rnorm(1200), ncol=6)
heatmap.2(x=mat)
file<- read.csv("Heatmap_C3vsT3 and C7vsT7.csv")
heatmap.2(file)
