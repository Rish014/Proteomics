library(ggplot2)
library(dplyr)
install.packages("dplyr")
library(dplyr)
BiocManager::install("edgeR")
library(edgeR)
dplyr::count
# https://www.biostars.org/p/245490/
getwd()

setwd("/Users/girish/Documents/M9 and DH5a Data analysis/M15 strain Shortlisted data using R ")
getwd()

dir()
myDF<- read.csv("M15_M9C6 vs M9T6 for P value.csv")
head(myDF)
boxplot()

LBC6<- read.table(file.choose("M15_LBC6.csv"), header = T, sep = "\t")
names(LBC6)
class(LBC6)
getwd()
setwd("/Users/girish/Documents/M9 and DH5a Data analysis/DH5 shrotlisted using R")
getwd()

dir()
myDF<- read.csv("BL21_C7_T7_P value.csv")
head(myDF)

d<- DGEList(counts = myDF[,2:5], group = c(rep("M9C6_Rep1",2), rep("M9T6_Rep1",2)), genes = myDF[,1])
d <- calcNormFactors(d)
d <- estimateCommonDisp(d)
d <- estimateTagwiseDisp(d)
d <- estimateTrendedDisp(d)
de <- exactTest(d, pair=c("M9C6_Rep1", "M9T6_Rep1"), dispersion = "tagwise")
deDF <- as.data.frame(de)
head(deDF)
print(deDF)
View(deDF)
ß

qplot(data=deDF, table.logFC, table.PValue)

p1<- c(-log10(PValue))


p1
qplot(data = deDF, logFC, PValue)

install.packages("writexl")
library("writexl")
getwd()
write_xlsx(deDF, "~/Documents/M9 and DH5a Data analysis/M15 strain Shortlisted data using R /M15_M9C6 vs M9T6_P value with foldchange.xlsx")
