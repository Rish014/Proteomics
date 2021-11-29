
install.packages(dplyr)
library(dplyr)
library(ggplot2)
getwd()

setwd("/Users/girish/Documents/M9 and DH5a Data analysis/M15 strain Shortlisted data using R ")

dir()
tmp<- read.csv("BL21_C3_T3_V plot.csv")
de<- tmp[complete.cases(tmp),]

p<- ggplot(data=de, aes(x=Log2FC, y=X..log10..Pvalue))+geom_point()


p2 <- p + geom_vline(xintercept=c(-1, 1), col="red") +
  geom_hline(yintercept=0.05, col="red") 

p2 + scale_y_continuous(breaks = seq(0, 330, by = 20)) + 
  scale_x_continuous(breaks = seq(-30, 30, by = 3))
  
p2
de$diffexpressed <- "NO"
de$diffexpressed[de$Log2FC > 1 & de$X..log10..Pvalue >= 0.05] <- "UP"
de$diffexpressed[de$Log2FC < -1 & de$X..log10..Pvalue >= 0.05] <- "DOWN"

p3<- p2 + scale_y_continuous(breaks = seq(0, 330, by = 10)) + 
  scale_x_continuous(breaks = seq(-20, 30, by = 3))

p4 <- p3 + scale_color_manual(values=c("blue", "black", "red"))
p4
mycolors <- c("blue", "red", "black")
names(mycolors) <- c("DOWN", "UP", "NO")
p5 <- p4 + scale_colour_manual(values = mycolors)
p5

de$delabel <- NA
de$delabel[de$diffexpressed != "NO"] <- de$genes[de$diffexpressed != "NO"]

ggplot(data=de, aes(x=Log2FC, y=X..log10..Pvalue, col=diffexpressed, label=delabel)) + 
  geom_point() + 
  theme_minimal() +
  geom_text()

library(ggrepel)

ggplot(data=de, aes(x=Log2FC, y=X..log10..Pvalue, col=diffexpressed, label=delabel)) +
  geom_point() + 
  theme_minimal() +
  geom_text_repel() +
  scale_color_manual(values=c("blue", "black", "red")) +
  geom_vline(xintercept=c(-1, 1), col="red") +
  geom_hline(yintercept=0.05, col="red")
  



getwd()

setwd("/Users/girish/Documents/M9 and DH5a Data analysis")

getwd()

version
