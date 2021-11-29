#Library requirment

library(gplots)
library(tidyverse) # data manipulation
library(cluster)   # clustering algorithms
library(factoextra) # clustering algorithms & visulalization


# Files import and preparations
dir()
LC <- read.csv("DH5 LB and M9 Heatmap.csv", sep = ",")
View(LC)
LC<- LC[order(LC$M9C6.1),]
rownames(LC)<- LC$X
LC<- LC[1:1295,-1]
LC<- data.matrix(LC)

#log transforms and scaling

plot(LC)
Log_LC<- log10(LC+1)
SC_LC<- scale(Log_LC, scale= TRUE)
y<- SC_LC

#optional cluster determination

fviz_nbclust(y, kmeans, method ="wss")

fviz_nbclust(y, kmeans, method = "wss")
fviz_nbclust(y, kmeans, method = "silhouette")

#k means cluster

final<- kmeans (y, 16, nstart = 25 )
fviz_cluster(final, data = y, labelsize = 1)

#row and column wise clustering

hr<- hclust(as.dist(1-cor(t(y), method = "pearson")), method = "complete")
hc<- hclust(as.dist(1-cor(y, method = "spearman")), method = "complete")
mycl<- cutree(hr, h=max(hr$height)/1.5); mycolhc<- rainbow(length(unique(mycl)),start = 0.1, end = 0.9);mycolhc<- mycolhc[as.vector(mycl)] 
cluster<- as.matrix(mycl)
output<- cbind(y, cluster)


#plot Heatmap

mycol<- colorpanel(75, "red", "black", "green")
heatmap.2(y, RowSideColors = mycolhc, Rowv = as.dendrogram(hr), Colv = as.dendrogram(hc), col = mycol, density.info = "none", trace = "none", dendrogram = "both", key.xlab = "NA", key.ylab = "NA", scale = "row", labRow = FALSE)

#save files
getwd()

write.csv(output, "/Users/girish/Documents/M9 and DH5a Data analysis/DH5 M9C6vsM9T6 and M9C12vsM9T12 Heatmap.csv", row.names = TRUE)

#save plots as PNG heatmap

png(paste(format(Sys.time(),"%Y-%m-%d-%H-%M-%S"), "png", sep = ","), width = 12, height = 10, units = 'in', res = 300)
setwd("/Users/girish/Documents/M9 and DH5a Data analysis")

heatmap.2(y, RowSideColors = mycolhc, Rowv = as.dendrogram(hr), Colv = as.dendrogram(hc), col = mycol, density.info = "none", trace = "none", dendrogram = "both", key.xlab = "NA", key.ylab = "NA", scale = "row", labRow = FALSE)

# save plots as png files_wss

png(paste(format(Sys.time(),"%Y-%m-%d-%H-%M-%S"), "png", sep = ","), width = 12, height = 10, units = 'in', res = 300)

setwd("/Users/girish/Documents/M9 and DH5a Data analysis")

fviz_nbclust(y, kmeans, method = "wss")

# save plots as png files_Silhouette

png(paste(format(Sys.time(),"%Y-%m-%d-%H-%M-%S"), "png", sep = ","), width = 12, height = 10, units = 'in', res = 300)

setwd("/Users/girish/Documents/M9 and DH5a Data analysis")

fviz_nbclust(y, kmeans, method = "silhouette")

# save plots as png files_final cluster

png(paste(format(Sys.time(),"%Y-%m-%d-%H-%M-%S"), "png", sep = ","), width = 12, height = 10, units = 'in', res = 300)

setwd("/Users/girish/Documents/M9 and DH5a Data analysis")

fviz_cluster(final, data=y, labelsize=1)


