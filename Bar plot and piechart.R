

genes_significance <- rep(c("enriched", "depleted", "none"), c(638, 310, 948))
barplot(table(genes_significance))
barplot(table(genes_significance), col=c("blue", "red", "grey"))

barplot(table(genes_significance), col=c("blue", "red", "grey"), names.arg=c("Down", "Up", "Not significant"), main="WT_C7vsT7 bar plot")



pie(table(genes_significance))

pie(table(genes_significance), col=c("blue", "red", "grey"), main="WT_C7vsT7 pie chart",
labels=c("Down (19.92%)", "Up (41.00%", "Not significant (60.92%"))


    dir()

getwd()

setwd("/Users/girish/Documents/M9 and DH5a Data analysis")

getwd()

dir()
tmp<- read.csv("Bar plot_C3vsT3 and C7vsT7.csv")
Genes <- tmp[complete.cases(tmp),]


means<-aggregate(df,by=list(df$gender),mean)


df <- read.table(text=
                 "Group	    Up	 Down	 Not Significant	Sample
                  C3vsT3	  164	  289	    1661	          1
                  C7vsT7	  188	  328	    1598	          2", header=TRUE)

library(reshape2)
library(dplyr)
df.melt <- melt(df, id="Sample")
bar <- group_by(df.melt, variable, sample)%.%summarise(mean=mean(value))

library(ggplot2)
ggplot(bar, aes(x=variable, y=mean, fill=factor(Sample)))+
  geom_bar(position="dodge", stat="identity")






